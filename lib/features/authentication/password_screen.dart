import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/authentication/birthday_screen.dart';

import 'package:flutterpractice/features/authentication/widgets/form_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _onSubmit() {
    if (_password.isEmpty || !_passwordVaild() || !_passwordVaildSecond()) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  bool _passwordVaild() {
    return _password.length > 8 && _password.length < 20;
  }

  bool _passwordVaildSecond() {
    final regExp = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$");
    return regExp.hasMatch(_password);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
            vertical: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gaps.v32,
              TextField(
                onEditingComplete: () => _onSubmit(),
                autocorrect: false,
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: const FaIcon(
                          FontAwesomeIcons.circleXmark,
                        ),
                      ),
                      Gaps.h14,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Make it Strong",
                  contentPadding: const EdgeInsets.only(
                    top: 0,
                    left: 10,
                    right: 10,
                  ),
                ),
              ),
              Gaps.v10,
              Text(
                "Your password nust have:",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color:
                        _passwordVaild() ? Colors.green.shade300 : Colors.black,
                  ),
                  Gaps.h7,
                  const Text("8 to 20 characters"),
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _passwordVaildSecond()
                        ? Colors.green.shade300
                        : Colors.black,
                  ),
                  Gaps.h7,
                  const Text("Letters, numbers, and special characters"),
                ],
              ),
              Gaps.v40,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: _password.isEmpty ||
                      !_passwordVaild() ||
                      !_passwordVaildSecond(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
