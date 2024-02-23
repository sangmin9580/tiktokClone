import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(icon),
        Gaps.v10,
        Text(text),
      ],
    );
  }
}
