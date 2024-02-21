import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _page = Page.first;

  void _onNextTap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _page = Page.second;
      });
    } else {
      setState(() {
        _page = Page.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
            bottom: Sizes.size14,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              duration: const Duration(
                milliseconds: 300,
              ),
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v40,
                  Text(
                    "Watch cool videos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size32,
                    ),
                  ),
                  Gaps.v14,
                  Text(
                    "videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.v24,
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v40,
                  Text(
                    "Follow the rules",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size32,
                    ),
                  ),
                  Gaps.v14,
                  Text(
                    "follow the rule!!!! hey~",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.v24,
                ],
              ),
              crossFadeState: _page == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 300,
            ),
            opacity: _page == Page.first ? 0 : 1,
            child: CupertinoButton(
              onPressed: _onNextTap,
              color: Colors.red.shade300,
              child: const Text("Next"),
            ),
          ),
        ),
      ),
    );
  }
}
