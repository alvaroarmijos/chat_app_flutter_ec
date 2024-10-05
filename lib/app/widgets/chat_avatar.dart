import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({
    super.key,
    this.urlImage,
    required this.name,
    this.radius = 20,
  });

  final String? urlImage;
  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return urlImage != null
        ? CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(urlImage!),
          )
        : name.isEmpty
            ? Container(
                width: radius * 2,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
              )
            : Avatar(
                name: name,
                shape: AvatarShape.circle(radius),
              );
  }
}
