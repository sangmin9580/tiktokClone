import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/videos/widgets/video_button.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  final ScrollController _scrollController = ScrollController();

  void _onXmarkTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  bool _isWriting = false;

  void _onStopWriting(BuildContext context) {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.75,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "22796 comments",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(
              onPressed: () => _onXmarkTap(context),
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
              ),
            ),
            Gaps.h12,
          ],
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () => _onStopWriting(context),
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    right: Sizes.size10,
                    left: Sizes.size10,
                    bottom: Sizes.size96,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) => const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text(
                          "상민",
                        ),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("상민"),
                            Gaps.v5,
                            Text(
                              "That's not it I've seen the same thing but also in a cave,",
                            ),
                          ],
                        ),
                      ),
                      Gaps.v10,
                      VideoButton(icon: FontAwesomeIcons.heart, text: "52.5k")
                    ],
                  ),
                  separatorBuilder: (context, index) => Gaps.v20,
                ),
              ),
              Positioned(
                width: size.width,
                bottom: 0,
                child: BottomAppBar(
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          child: Text("상민"),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size40,
                            child: TextField(
                              onTap: _onWriting,
                              maxLines: null,
                              minLines: null,
                              expands: true,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size10,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.at,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.gift,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.grey.shade900,
                                      ),
                                      if (_isWriting) Gaps.h14,
                                      if (_isWriting)
                                        GestureDetector(
                                          onTap: () => _onStopWriting(context),
                                          child: FaIcon(
                                            FontAwesomeIcons.circleArrowUp,
                                            color: Colors.red.shade300,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(
                                  top: Sizes.size10,
                                  left: 5,
                                ),
                                hintText: "Add comments...",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
