import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.faIcon,
    required this.text,
    super.key,
  });

  final String text;
  final IconData faIcon;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size12,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.3,
              ),
            ),
            child: Stack(
              children: [
                FaIcon(
                  faIcon,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          Gaps.v20,
        ],
      ),
    );
  }
}
