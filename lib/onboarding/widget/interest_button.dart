import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/sizes.dart';

class InterstButton extends StatefulWidget {
  const InterstButton({
    super.key,
    required this.interst,
  });

  final String interst;

  @override
  State<InterstButton> createState() => _InterstButtonState();
}

class _InterstButtonState extends State<InterstButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size14,
          vertical: Sizes.size10,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Colors.red.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size32,
          ),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: Sizes.size5,
              spreadRadius: Sizes.size5,
            )
          ],
        ),
        child: Text(
          widget.interst,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
