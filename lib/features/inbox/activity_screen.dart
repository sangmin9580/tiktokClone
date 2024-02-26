import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 150,
    ),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  late final Animation<double> _arrowanimation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  late final Animation<Offset> _slideAnimation =
      Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
          .animate(_animationController);

  late final Animation<Color?> _modalBarrierAnimation =
      ColorTween(begin: Colors.transparent, end: Colors.black54)
          .animate(_animationController);

  final List _notifications = List.generate(20, (index) => "$index");
  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "All activity",
      "icon": FontAwesomeIcons.solidMessage,
    },
    {
      "title": "Likes",
      "icon": FontAwesomeIcons.solidHeart,
    },
    {
      "title": "Comments",
      "icon": FontAwesomeIcons.solidComments,
    },
    {
      "title": "Mentions",
      "icon": FontAwesomeIcons.at,
    },
    {
      "title": "Followers",
      "icon": FontAwesomeIcons.solidUser,
    },
    {
      "title": "From TikTok",
      "icon": FontAwesomeIcons.tiktok,
    }
  ];
  bool _isBarriered = false;

  void _onDismissed(String notification) {
    _notifications.remove(notification);
  }

  void _onToggleTap() async {
    _animationController.forward();
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    }
    setState(() {
      _isBarriered = !_isBarriered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _onToggleTap,
              child: const Text("All activity"),
            ),
            Gaps.h2,
            RotationTransition(
              turns: _arrowanimation,
              child: const FaIcon(
                FontAwesomeIcons.chevronDown,
                size: Sizes.size16,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Text("New"),
            ),
            Gaps.v10,
            for (var notification in _notifications)
              Dismissible(
                onDismissed: (direction) => _onDismissed(notification),
                key: Key(notification),
                background: Container(
                  padding: const EdgeInsets.only(
                    left: Sizes.size16,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const FaIcon(
                    FontAwesomeIcons.checkDouble,
                    color: Colors.white,
                  ),
                ),
                secondaryBackground: Container(
                  padding: const EdgeInsets.only(
                    right: Sizes.size16,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  alignment: Alignment.centerRight,
                  child: const FaIcon(
                    FontAwesomeIcons.trash,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  minVerticalPadding: Sizes.size16,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      border: Border.all(
                        color: Colors.black45,
                        width: 0.3,
                      ),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                      ),
                    ),
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: Sizes.size16,
                    color: Colors.black54,
                  ),
                  title: RichText(
                    text: TextSpan(
                      text: "Account updates: ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        const TextSpan(
                          text: "Upload longer videos",
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${notification}h",
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: Sizes.size12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ]),
          if (_isBarriered)
            AnimatedModalBarrier(
              color: _modalBarrierAnimation,
              dismissible: true,
              onDismiss: _onToggleTap,
            ),
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var tab in _tabs)
                    ListTile(
                      title: Row(
                        children: [
                          FaIcon(
                            tab["icon"],
                            size: Sizes.size20,
                          ),
                          Gaps.h16,
                          Text(
                            tab["title"],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
