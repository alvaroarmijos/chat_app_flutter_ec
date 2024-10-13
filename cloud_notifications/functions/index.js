
const functions = require('firebase-functions')
const admin = require('firebase-admin')

admin.initializeApp()

exports.pushNotifications = functions.database.ref('/chats/{chatId}/{messageId}').onCreate((snap, context) => {
    console.log('New message added')

    const value = snap.val()
    const sentTo = value.sentTo
    const sentBy = value.sentBy

    const name = admin.database().ref(`/contacts/${sentBy}/name`).once('value')
    const token = admin.database().ref(`/contacts/${sentTo}/token`).once('value')

    Promise.all([name, token]).then( async (values) => {
        const name = values[0].val()
        const token = values[1].val()

        if (token == null) return {error: 'No token'}

        // Crear notification
        const payload = {
            token: token,
            notification: {
                title: name,
                body: value.message
            }
        }

        try {
            const response = await admin.messaging().send(payload)

            console.log('Correct sent message', response)

            return {success: true}
        } catch (error) {
            console.log('Error:', error)
            return {error: error.code}
        }

    })

})