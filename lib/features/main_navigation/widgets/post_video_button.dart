import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({
    super.key,
    required this.isHovered,
    required this.onEnter,
    required this.onExit,
  });

  final Function(PointerEvent event) onEnter;
  final Function(PointerEvent event) onExit;
  final bool isHovered;

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => widget.onEnter(event),
      onExit: (event) => widget.onExit(event),
      child: SizedBox(
        height: 35,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                    Sizes.size8,
                  ),
                ),
                height: 35,
                width: 25,
              ),
            ),
            Positioned(
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(
                    Sizes.size8,
                  ),
                ),
                height: 35,
                width: 25,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              alignment: Alignment.center,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: widget.isHovered ? Sizes.size32 : Sizes.size20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
