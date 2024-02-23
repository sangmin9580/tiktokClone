import 'package:flutter/material.dart';
import 'package:flutterpractice/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  int _itemCount = 4;
  final Duration _scrollDuration = const Duration(
    microseconds: 300,
  );
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;

      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    // 틱톡은 계속 똑같은걸 looping해서 Return으로 바꿈
    // _pageController.nextPage(
    //   duration: _scrollDuration,
    //   curve: _scrollCurve,
    // );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    Future.delayed(
      const Duration(
        seconds: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          displacement: 50,
          edgeOffset: 20,
          onRefresh: _onRefresh,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) => VideoPost(
              onVideoFinished: _onVideoFinished,
              index: index,
            ),
            itemCount: _itemCount,
            scrollDirection: Axis.vertical,
            onPageChanged: _onPageChanged,
          ),
        ),
      ],
    );
  }
}
