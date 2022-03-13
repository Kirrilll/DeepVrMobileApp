import 'package:deepvr/page_widgets/booking_page_switch_btn.dart';
import 'package:deepvr/page_widgets/booking_page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPageMaket extends StatelessWidget {
  const BookingPageMaket({
    Key? key,

    required this.stepNumber,
    required this.content,
    required this.stepTitle,
    required this.action
  }) : super(key: key);

  final Widget content;
  final int stepNumber;
  final String stepTitle;
  final void Function() action;
  final bool isLast = false;
  final bool isFirst = false;

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
          const SizedBox(height: 48),
          Builder(builder: (context) {
            if (isLast) {
              return BookPageSwitchingBtn(action: action, text: 'Подтвердить');
            }
            else if (isFirst) {
              return BookPageSwitchingBtn(action: action, text: 'Далее');
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BookPageSwitchingBtn(action: action, text: 'Назад'),
                const SizedBox(width: 15),
                BookPageSwitchingBtn(action: action, text: 'Далее')
              ],
            );
          })
        ],
      ),
    );
  }
}
