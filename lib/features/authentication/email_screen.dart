import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/authentication/password_screen.dart';
import 'package:flutterpractice/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  void _onSubmit() {
    if (_email.isEmpty || _emailValid() != null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  String? _emailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) return "Email not Valid";
    return null;
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
                "What is your email?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gaps.v32,
              TextField(
                onEditingComplete: () => _onSubmit(),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: _emailController,
                decoration: InputDecoration(
                  errorText: _emailValid(),
                  hintText: "Email",
                  contentPadding: const EdgeInsets.only(
                    top: 0,
                    left: 10,
                  ),
                ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: _email.isEmpty || _emailValid() != null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
