import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part './event_progress_bar_line.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
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