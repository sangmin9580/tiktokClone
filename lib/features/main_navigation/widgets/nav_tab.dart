import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationTab extends StatelessWidget {
  const NavigationTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final bool isSelected;
  final IconData icon;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 300,
            ),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              children: [
                FaIcon(icon),
                Gaps.v10,
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
