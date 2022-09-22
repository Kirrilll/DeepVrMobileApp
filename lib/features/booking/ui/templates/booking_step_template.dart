import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/shared/default_button.dart';
import '../screens/booking_page.dart';

//Прокидывать builder панели навигации, с колбэками mayNext, mayBack, onNext, onNextAsync
class BookingStepTemplate extends StatelessWidget {
  const BookingStepTemplate({
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
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
                stepTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontFamily: 'Bebas',
                fontWeight: FontWeight.w700,
                fontSize: 46,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: content),
        ],
      ),
    );
  }
}
