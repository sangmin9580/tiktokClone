import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/authentication/login_screen.dart';
import 'package:flutterpractice/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  void _loginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v20,
              Text(
                "Sign up for TikTok",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gaps.v10,
              const Text(
                "Create a profile, follow other acounts, make your own videos, and more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gaps.v40,
              const AuthButton(
                faIcon: FontAwesomeIcons.user,
                text: "Use Phone or email",
              ),
              const AuthButton(
                faIcon: FontAwesomeIcons.facebook,
                text: "Continue with Facebook",
              ),
              const AuthButton(
                faIcon: FontAwesomeIcons.google,
                text: "Continue with Google",
              ),
              const AuthButton(
                faIcon: FontAwesomeIcons.apple,
                text: "Continue with Apple",
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Gaps.h2,
            GestureDetector(
              onTap: () => _loginTap(context),
              child: const Text(
                "Log in",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
