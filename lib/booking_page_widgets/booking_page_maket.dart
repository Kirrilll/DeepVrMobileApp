import 'package:deepvr/booking_page_widgets/booking_page_switch_btn.dart';
import 'package:deepvr/booking_page_widgets/booking_page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPageMaket extends StatelessWidget {
  BookingPageMaket({
    Key? key,
    required this.stepNumber,
    required this.content,
    required this.stepTitle,
    required this.pageController
  }) : super(key: key);

  BookingPageMaket.last(
      Key? key,
      this.content,
      this.stepNumber,
      this.stepTitle,
      this.confirm) : super(key: key){
    isLast = true;
  }

  BookingPageMaket.first(
      Key? key,
      this.content,
      this.stepNumber,
      this.stepTitle,
      this.pageController
      ): super(key: key){
    isFirst = true;
  }

  final Widget content;
  final int stepNumber;
  final String stepTitle;
  late PageController? pageController;
  late void Function()? confirm;

  var isLast = false;
  var isFirst = false;

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
              return BookPageSwitchingBtn(
                  action: confirm!,
                  text: 'Подтвердить'
              );
            }
            else if (isFirst) {
              return BookPageSwitchingBtn(
                  action: () async {
                    await pageController!.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  text: 'Далее'
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BookPageSwitchingBtn(
                    action: () async {
                      await pageController!.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut
                      );
                    },
                    text: 'Назад'
                ),
                const SizedBox(width: 15),
                BookPageSwitchingBtn(action: () async {
                  await pageController!.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                }, text: 'Далее')
              ],
            );
          })
        ],
      ),
    );
  }
}
