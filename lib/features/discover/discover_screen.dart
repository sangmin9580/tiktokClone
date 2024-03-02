import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/breakpoints.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final _tabs = [
    " Top",
    " Users",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands",
  ];

  final TextEditingController _textEditingController =
      TextEditingController(text: "initial text");

  void _onTap(int index) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Container(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: CupertinoSearchTextField(
              controller: _textEditingController,
            ),
          ),
          bottom: TabBar(
            onTap: (value) => _onTap(value),
            isScrollable: true,
            splashFactory: NoSplash.splashFactory,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in _tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size5,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth > Breakpoints.lg ? 5 : 2,
                mainAxisSpacing: Sizes.size10,
                crossAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                  //LayoutBuilder는 화면widget의크기를 측정할때 쓰는 것
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/image.jpg",
                          image:
                              "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "sdajd flkjs dlkfjsljflsd jlfsjd lfjs dfaadsfjshdfjkahtadlfjaslk",
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.v3,
                    if (constraints.maxWidth < 200 ||
                        constraints.maxWidth > 250)
                      DefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              foregroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/3612017"),
                            ),
                            Gaps.h2,
                            Expanded(
                              child: Text(
                                "askjdfljsdlfasjdfkladjflkdjsfljsadflk",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: 10,
                            ),
                            Text(
                              "  2.5M",
                            )
                          ],
                        ),
                      )
                  ],
                );
              }),
            ),
            for (var tab in _tabs.skip(1))
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}
