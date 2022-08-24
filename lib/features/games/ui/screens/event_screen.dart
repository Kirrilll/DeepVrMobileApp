import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EventScreen extends StatefulWidget {
  const EventScreen({Key? key, required this.pages}) : super(key: key);

  final List<String> pages;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with SingleTickerProviderStateMixin {
  int _currPageIndex = 0;
  late final List<bool> pagesLoadedList = List.filled(widget.pages.length, false);
  late final AnimationController _animationController;
  bool isReady = false;


  Future<void> _loadAllImages() async {
    for(int i =0; i < widget.pages.length; i++){
      await precacheImage(NetworkImage(widget.pages[i]), context);
    }
  }
  _loadNextPage() {
    _animationController.reset();
    setState(() {
      _currPageIndex++;
    });
    _animationController.forward();
  }

  void _startWatching() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        if (_currPageIndex != widget.pages.length - 1) {
          _loadNextPage();
        } else {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animationController.duration = const Duration(seconds: 2);
    _startWatching();
    super.initState();
  }

  @override
  void didChangeDependencies() {

    _loadAllImages().then((value){
      setState(() {
        isReady = true;
      });
      _animationController.forward();
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _EventContent(
              currPageIndex: _currPageIndex,
              imagesUrls: widget.pages,
              isReady: isReady
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _ProgressBar(
                    count: widget.pages.length,
                    animationController: _animationController,
                    currPageIndex: _currPageIndex,
                  ),
                  const SizedBox(height: 8),
                  InkResponse(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.clear,
                        color: Color(0xFFABAFE5),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _EventContent extends StatelessWidget {
  const _EventContent(
      {Key? key,
      required this.currPageIndex,
      required this.imagesUrls,
      required this.isReady})
      : super(key: key);

  final List<String> imagesUrls;
  final int currPageIndex;
  final bool isReady;
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => isReady
            ? Stack(
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
              )
            : const ColoredBox(
              color: Colors.black,
              child: Center(
                  child: CircularProgressIndicator(),
                ),
            ));
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar(
      {Key? key,
      required this.count,
      required this.animationController,
      required this.currPageIndex})
      : super(key: key);

  final int count;
  final AnimationController animationController;
  final int currPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 0; i < count * 2 - 1; i++)
          i.isEven
              ? Expanded(
                  child: _ProgressBarLine(
                  animationController: animationController,
                  position: (i == 0 ? 0 : i - 1) - currPageIndex,
                ))
              : const SizedBox(width: 6)
      ],
    );
  }
}

class _ProgressBarLine extends StatelessWidget {
  const _ProgressBarLine(
      {Key? key, required this.animationController, required this.position})
      : super(key: key);

  final AnimationController animationController;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Builder(builder: (context) {
        if (position == 0) {
          return AnimatedBuilder(
            builder: (_, child) => LinearProgressIndicator(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.22),
              color: Colors.white,
              value: animationController.value,
            ),
            animation: animationController,
          );
        } else if (position > 0) {
          return const ColoredBox(color: Color.fromRGBO(255, 255, 255, 0.22));
        }
        return const ColoredBox(color: Colors.white);
      }),
      height: 6,
    );
  }
}
