import 'package:deepvr/booking_page_widgets/booking_page_switch_btn.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 33),
          BookingPageTitle(
            step: stepNumber,
            title: stepTitle,
          ),
          const SizedBox(height: 36),
          Expanded(child: content),
        ],
      ),
    );
  }
}
