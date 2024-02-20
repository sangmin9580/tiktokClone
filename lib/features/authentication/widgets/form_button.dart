import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
          color: disabled ? Colors.grey.shade400 : Colors.red.shade300,
        ),
        child: const AnimatedDefaultTextStyle(
          duration: Duration(
            milliseconds: 500,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          child: Text(
            "NEXT",
          ),
        ),
      ),
    );
  }
}
