import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/gaps.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/videos/widgets/video_button.dart';
import 'package:flutterpractice/features/videos/widgets/video_comments.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  final Function onVideoFinished;
  final int index;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");
  // 이건 VideoPlayerContrller에 설계도를 가지고 _videoPlayerController라는 차를 만든 행위

  late final AnimationController _animationController;
  bool _isPaused = false;
  bool _wantSeeMore = false;

  final Duration _animationDuration = const Duration(
    milliseconds: 300,
  );

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration <=
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideo() async {
    await _videoPlayerController.initialize();
    // _videoPlayerController라는 차에 시동을 걸고, 내부 작업을 하는 행위
    // Video는 워낙 내용이 크다보니 어쩔 수 없음 무조건 이렇게 따로 initialize해야함
    // 반대로 TexteditingController는 이런과정이 필요 없음
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChange);
    // intistate가 먼저 build되지만, _initVideo()는 비동기함수라서, build함수보다 늦게
    // build될 수 있음. 그래서 build함수에게 initailze되면 setstate로 알려줘야함
    // await 함수는 해당 함수안에서 코드가 작성되지만, 큰 틀(init=>build함수)에서는 영향이 없음
    // 즉, 일단 빌드함수가 시작되고, 나중에 await함수가 이루어질 수도 있다는 뜻
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
    _animationController = AnimationController(
      vsync: this,
      upperBound: 1.5,
      lowerBound: 1.0,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      print("Video ${widget.index} is ${info.visibleFraction * 100} visible ");
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(
      () {
        _isPaused = !_isPaused;
      },
    );
  }

  void _onSeeMoreTap() {
    _wantSeeMore = !_wantSeeMore;
    setState(() {});
  }

  Future<void> _onCommandTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Transform.scale(
                    scale: _animationController.value,
                    child: child,
                  ),
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _isPaused ? 1 : 0,
                    child: FaIcon(
                      _isPaused
                          ? FontAwesomeIcons.pause
                          : FontAwesomeIcons.play,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@상민",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Gaps.v10,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "This is my house in Thailand!!asdfjhdks",
                    maxLines: _wantSeeMore ? 10 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.55,
            child: GestureDetector(
              onTap: _onSeeMoreTap,
              child: Text(
                !_wantSeeMore ? "See More" : "No more",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 25,
                  foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3612017",
                  ),
                  child: Text("상민"),
                ),
                Gaps.v24,
                const VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: () => _onCommandTap(context),
                  child: const VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: "33K",
                  ),
                ),
                Gaps.v24,
                const VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
