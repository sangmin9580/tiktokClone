import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/authentication/email_screen.dart';
import 'package:flutterpractice/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create username",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gaps.v10,
            Text(
              "You can always change this later.",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Gaps.v32,
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                contentPadding: EdgeInsets.only(
                  top: 0,
                  left: 10,
                ),
              ),
            ),
            Gaps.v40,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                disabled: _username.isEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
