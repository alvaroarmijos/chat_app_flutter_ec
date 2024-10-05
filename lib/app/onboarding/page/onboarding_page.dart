import 'package:chat_app_flutter_ec/app/onboarding/onboarding.dart';
import 'package:chat_app_flutter_ec/app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final onboardingCubit = context.read<OnboardingCubit>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AppDrawables.onbordingBackgroundDrawable,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Image.asset(
                    AppDrawables.appIconDrawable,
                  ),
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Connect friends ',
                          style: textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'easily & quickly',
                              style: textTheme.displayLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Our chat app is the perfect way to stay connected with friends and family.',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(
                        iconPath: AppDrawables.facebookIconDrawable,
                        borderColor: AppColors.grey,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SocialMediaButton(
                        iconPath: AppDrawables.googleIconDrawable,
                        borderColor: AppColors.grey,
                        onTap: onboardingCubit.signInWithGoogle,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SocialMediaButton(
                        iconPath: AppDrawables.appleIconDrawable,
                        color: Colors.white,
                        borderColor: AppColors.grey,
                      ),
                    ],
                  ),
                  const OnboardingDivider(),
                  OnboardingButton(
                    onTap: () {},
                  ),
                  TextButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account? ',
                        style: textTheme.bodyLarge?.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
