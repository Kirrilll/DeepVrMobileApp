import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventContent extends StatelessWidget {
  const EventContent(
      {Key? key,
      required this.currPageIndex,
      required this.imagesUrls,
      required this.isReady,
      required this.animationController,
        required this.nextPage
      })
      : super(key: key);

  final List<String> imagesUrls;
  final AnimationController animationController;
  final int currPageIndex;
  final bool isReady;
  final VoidCallback nextPage;

  void onTapDown(TapDownDetails details){
    animationController.stop();
  }

  void onTapUp(TapUpDetails details){
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => isReady
            ? InkResponse(
                onTapDown: onTapDown,
                onTapUp: onTapUp,
                onDoubleTap: nextPage,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ...<Widget>[
                      for (int pageIndex = 0;
                          pageIndex < imagesUrls.length;
                          pageIndex++)
                        Visibility(
                          visible: currPageIndex == pageIndex,
                          child: Image(
                            image: NetworkImage(imagesUrls[pageIndex]),
                            fit: BoxFit.fill,
                          ),
                        )
                    ]
                  ],
                ),
              )
            : const ColoredBox(
                color: Colors.black,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
