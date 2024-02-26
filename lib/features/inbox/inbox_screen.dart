import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/inbox/activity_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  _onTapActivity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ActivityScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "inbox",
        ),
        centerTitle: true,
        actions: const [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.paperPlane,
              ),
              Gaps.h20,
            ],
          ),
        ],
      ),
      body: ListView(children: [
        ListTile(
          onTap: () => _onTapActivity(context),
          title: Text(
            "Activity",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: const FaIcon(
            FontAwesomeIcons.chevronRight,
            size: Sizes.size16,
            color: Colors.black54,
          ),
        ),
        Gaps.v20,
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue.shade400,
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.users,
              ),
            ),
          ),
          title: Text(
            "New followers",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: const Text("Messages from followers wii apperar here."),
          trailing: const FaIcon(
            FontAwesomeIcons.chevronRight,
            size: Sizes.size16,
            color: Colors.black54,
          ),
        ),
      ]),
    );
  }
}
