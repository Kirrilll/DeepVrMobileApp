import 'package:deepvr/booking_page_widgets/booking_page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPageMaket extends StatelessWidget {
  const BookingPageMaket({
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
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height-323.143,
          maxWidth: MediaQuery.of(context).size.width
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
              stepTitle,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.w700,
              fontSize: 46
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: content),
        ],
      ),
    );
  }
}
