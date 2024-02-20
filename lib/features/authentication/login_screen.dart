import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/authentication/login_form_screen.dart';

import 'package:flutterpractice/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _signUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onLoginFormTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
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
                "Log in to TIkTok",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gaps.v10,
              const Text(
                "Manage your account, check norifications, comment on videos. and more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onLoginFormTap(context),
                child: const AuthButton(
                  faIcon: FontAwesomeIcons.user,
                  text: "Use Phone / email / username",
                ),
              ),
              const AuthButton(
                faIcon: FontAwesomeIcons.facebook,
                text: "Continue with Facebook",
              ),
              const AuthButton(
                faIcon: FontAwesomeIcons.google,
                text: "Continue with Google",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            Gaps.h2,
            GestureDetector(
              onTap: () => _signUpTap(context),
              child: const Text(
                "Sign up",
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
