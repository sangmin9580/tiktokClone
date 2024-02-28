import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/features/discover/discover_screen.dart';
import 'package:flutterpractice/features/inbox/inbox_screen.dart';

import 'package:flutterpractice/features/main_navigation/widgets/nav_tab.dart';
import 'package:flutterpractice/features/main_navigation/widgets/post_video_button.dart';
import 'package:flutterpractice/features/users/user_profile_screen.dart';
import 'package:flutterpractice/features/videos/video_timeline_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 4;
  bool _isHovered = false;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPostButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record Video"),
            centerTitle: true,
          ),
        ),
      ),
    );
  }

  void _onEnter(PointerEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationTab(
              onTap: () => _onTap(0),
              isSelected: _currentIndex == 0,
              icon: FontAwesomeIcons.house,
              text: "Home",
            ),
            NavigationTab(
              onTap: () => _onTap(1),
              isSelected: _currentIndex == 1,
              icon: FontAwesomeIcons.compass,
              text: "Search",
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostButtonTap,
              child: PostVideoButton(
                isHovered: _isHovered,
                onEnter: (event) => _onEnter(event),
                onExit: _onExit,
              ),
            ),
            Gaps.h24,
            NavigationTab(
              onTap: () => _onTap(3),
              isSelected: _currentIndex == 3,
              icon: FontAwesomeIcons.message,
              text: "Inbox",
            ),
            NavigationTab(
              onTap: () => _onTap(4),
              isSelected: _currentIndex == 4,
              icon: FontAwesomeIcons.user,
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
