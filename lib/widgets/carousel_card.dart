import 'package:flutter/material.dart';
import 'package:project/constants/mock_data.dart';
import 'package:project/models/card_data.dart';
import 'package:project/widgets/custom_text_animation.dart';
import 'package:project/widgets/slide_in_animation.dart';
import 'package:video_player/video_player.dart';

class CarouselCard extends StatefulWidget {
  final CardData cardData;
  final bool isVisible;

  const CarouselCard({
    super.key,
    required this.cardData,
    required this.isVisible,
  });

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  bool hasAnimated = false;
  bool isInitialized = false;

  VideoPlayerController? videoPlayerController;

  Future<void> initializeVideoPlayer() async {
    videoPlayerController = VideoPlayerController.asset(
      widget.cardData.assetUrl ?? "",
    );
    await videoPlayerController!.initialize();
    videoPlayerController!.setLooping(true);
    videoPlayerController!.play();
    if (mounted) {
      setState(() {
        isInitialized = true;
      });
    }
  }

  Future<void> handleVideoPlayerInitialisation() async {
    if (widget.cardData.type == CardType.video && widget.isVisible) {
      initializeVideoPlayer();
    }
  }

  @override
  void initState() {
    super.initState();
    handleVideoPlayerInitialisation();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
  }

  @override
  void didUpdateWidget(CarouselCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.cardData.type == CardType.video) {
      if (widget.isVisible && !isInitialized) {
        initializeVideoPlayer();
      } else if (!widget.isVisible && videoPlayerController != null) {
        videoPlayerController?.pause();
        videoPlayerController?.dispose();
        videoPlayerController = null;
        setState(() {
          isInitialized = false;
        });
      }
    }

    if (widget.isVisible && !hasAnimated) {
      setState(() {
        hasAnimated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          (widget.cardData.type == CardType.video)
              ? Container(
                color: Colors.transparent,
                width: size.width,
                height: size.height,
                child:
                    (videoPlayerController != null && isInitialized)
                        ? AspectRatio(
                          aspectRatio: videoPlayerController!.value.aspectRatio,
                          child: VideoPlayer(videoPlayerController!),
                        )
                        : Center(child: CircularProgressIndicator()),
              )
              : const SizedBox.shrink(),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color:
                  widget.cardData.type == CardType.color
                      ? widget.cardData.background
                      : null,
              image:
                  widget.cardData.type == CardType.image
                      ? const DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/images/kerala1.jpg"),
                      )
                      : null,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: SizedBox(
                height: size.height * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: size.height * 0.15),
                    CustomTextAnimation(
                      child: Text(
                        widget.cardData.location.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color:
                              widget.cardData.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    CustomTextAnimation(
                      child: Text(
                        widget.cardData.title.toUpperCase(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color:
                              widget.cardData.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    LetterByLetterText(
                      text:
                          '${widget.cardData.latitude.toUpperCase()}, ${widget.cardData.longitude.toUpperCase()}',
                      textColor:
                          widget.cardData.isDarkTheme
                              ? Colors.white
                              : Colors.black,
                    ),
                    // SlideInAnimationWidget(
                    //   child: Text(
                    //     '${widget.cardData.latitude.toUpperCase()}, ${widget.cardData.longitude.toUpperCase()}',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w200,
                    //       letterSpacing: 2,
                    //       color:
                    //           widget.cardData.isDarkTheme
                    //               ? Colors.white
                    //               : Colors.black,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
