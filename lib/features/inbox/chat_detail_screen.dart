import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatState();
}

class _ChatState extends State<ChatDetailScreen> {
  void _onBodyTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade400,
                child: const Text("상민"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade400,
                  ),
                ),
              )
            ],
          ),
          title: Text(
            "상민",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: const Text(
            "Active now",
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.flag),
              Gaps.h20,
              FaIcon(
                FontAwesomeIcons.ellipsis,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _onBodyTap,
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                right: Sizes.size16,
                left: Sizes.size16,
                bottom: Sizes.size96,
                top: Sizes.size10,
              ),
              itemBuilder: (context, index) {
                var isMine = index % 2;
                return Row(
                  mainAxisAlignment: isMine == 0
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    isMine == 0
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size16,
                              horizontal: Sizes.size14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(
                                  Sizes.size16,
                                ),
                                topLeft: Radius.circular(
                                  Sizes.size20,
                                ),
                                bottomLeft: Radius.circular(
                                  Sizes.size20,
                                ),
                              ),
                            ),
                            child: const Text("sfjlasdas"),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size16,
                              horizontal: Sizes.size14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(
                                  Sizes.size16,
                                ),
                                topLeft: Radius.circular(
                                  Sizes.size20,
                                ),
                                bottomRight: Radius.circular(
                                  Sizes.size20,
                                ),
                              ),
                            ),
                            child: const Text("sfjlasdas"),
                          ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: BottomAppBar(
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.faceSmile,
                            ),
                          ),
                          hintText: "Send a message",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.paperPlane,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
