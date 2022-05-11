import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingStepLayout extends StatelessWidget {
  const BookingStepLayout({
    Key? key,
    required this.stepNumber,
    required this.content,
    required this.stepTitle,
  }) : super(key: key);


  final Widget content;
  final int stepNumber;
  final String stepTitle;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
              stepTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.w700,
              fontSize: 46,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: content),
        ],
      ),
    );
  }
}
