import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/breakpoints.dart';

import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/settings/settings_screen.dart';
import 'package:flutterpractice/features/users/widgets/persistent_tab_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void _onTapSetting(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  IconButton(
                    onPressed: () => _onTapSetting(context),
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                    ),
                  ),
                ],
                centerTitle: true,
                title: Text(
                  "상민",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: Text(
                        "상민",
                      ),
                    ),
                    Gaps.v10,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "@상민",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Gaps.h3,
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: FaIcon(
                              FontAwesomeIcons.check,
                              size: Sizes.size10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Text(
                                "97",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Gaps.v5,
                              const Text(
                                "Following",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                "10M",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Gaps.v5,
                              const Text(
                                "Followers",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                "194.3M",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Gaps.v5,
                              const Text(
                                "Likes",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33 >
                                  Breakpoints.xl * 0.5
                              ? Breakpoints.xl * 0.5
                              : MediaQuery.of(context).size.width * 0.33,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                            color: Colors.red.shade400,
                          ),
                          child: const Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gaps.h11,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 7,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black26,
                            ),
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.youtube,
                            ),
                          ),
                        ),
                        Gaps.h11,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 7,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black26,
                            ),
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.youtube,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        "All highlights and where to watch live matches on FIFA+ | I wonder how it would look",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v20,
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size14,
                        ),
                        Gaps.h5,
                        Text("Https://nomadcoders.co."),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 9 / 14,
                      mainAxisSpacing: Sizes.size1,
                      crossAxisSpacing: Sizes.size1,
                      crossAxisCount: constraints.maxWidth < 800
                          ? 3
                          : constraints.maxWidth > 1300
                              ? 7
                              : 5),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Image.asset(
                        "assets/images/image.jpg",
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 5,
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.play,
                              color: Colors.white,
                              size: Sizes.size16,
                            ),
                            Gaps.h5,
                            Text(
                              "4.1M $constraints ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text("Page two"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
