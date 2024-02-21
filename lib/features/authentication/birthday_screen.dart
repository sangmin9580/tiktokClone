import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';

import 'package:flutterpractice/features/authentication/widgets/form_button.dart';
import 'package:flutterpractice/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();
  DateTime maximumDate = DateTime(
    DateTime.now().year - 12,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  void _setTextFieldDate(DateTime date) {
    final textData = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textData);
  }

  void _onSubmit() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) => false,
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
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
                "When's your birthday?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gaps.v10,
              const Text("Your birthday won't be shown publicly"),
              Gaps.v32,
              TextField(
                onEditingComplete: () => _onSubmit(),
                autocorrect: false,
                controller: _birthdayController,
                decoration: const InputDecoration(
                  enabled: false,
                  contentPadding: EdgeInsets.only(
                    top: 0,
                    left: 10,
                    right: 10,
                  ),
                ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: _onSubmit,
                child: const FormButton(
                  disabled: false,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 300,
          child: CupertinoDatePicker(
            initialDateTime: maximumDate,
            maximumDate: maximumDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
