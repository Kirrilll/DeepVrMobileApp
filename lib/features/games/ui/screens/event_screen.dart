import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/event_content.dart';
import '../widgets/event_progress_bar.dart';


class EventScreen extends StatefulWidget {
  const EventScreen({Key? key, required this.pages}) : super(key: key);

  final List<String> pages;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> with SingleTickerProviderStateMixin {
  int _currPageIndex = 0;
  late final List<bool> pagesLoadedList = List.filled(widget.pages.length, false);
  late final AnimationController _animationController;
  bool isReady = false;


  Future<void> _loadAllImages() async {
    for(int i =0; i < widget.pages.length; i++){
      await precacheImage(NetworkImage(widget.pages[i]), context);
    }
  }
  void loadNextPage() {
    if (_currPageIndex != widget.pages.length - 1) {
      _animationController.reset();
      setState(() {
        _currPageIndex++;
      });
      _animationController.forward();
    }
    else{
      Navigator.pop(context);
    }
  }



  void _startWatching() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        if (_currPageIndex != widget.pages.length - 1) {
          loadNextPage();
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
          EventContent(
              animationController: _animationController,
              currPageIndex: _currPageIndex,
              imagesUrls: widget.pages,
              isReady: isReady,
              nextPage: loadNextPage,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ProgressBar(
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

