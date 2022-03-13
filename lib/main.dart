import 'package:deepvr/booking_page_item.dart';
import 'package:deepvr/page_func_widget/form.dart';
import 'package:deepvr/page_func_widget/players_counter.dart';
import 'package:deepvr/page_func_widget/time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.from(
        colorScheme: ThemeData.dark().colorScheme.copyWith(
            primary: Colors.white,
            secondary: const Color(0xFFABAFE5),
            background: Colors.black,
            secondaryContainer: const Color(0xFF1F2032)
        ),
      ),
      home: const Booking()));
}

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final pageController = PageController(initialPage: 0);

  int count = 1;

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: [
            BookingPageItem(
                stepNumber: 1,
                content: PlayerCounter(
                  count: count,
                  increment: () {
                    setState(() {
                      count += 1;
                    });
                  },
                  decrement: () {
                    if (count > 1) {
                      setState(() {
                        count -= 1;
                      });
                    }
                  },
                ),
                stepTitle: 'Выберите количесвто игроков',
                action: () {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                }),
            BookingPageItem(
              stepNumber: 2,
              content: const OrderingForm(),
              stepTitle: 'Выберите удобный для вас день',
              action: () {
                pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut);
              },
            ),
            BookingPageItem(
                stepNumber: 3,
                content: const TimePicker(),
                stepTitle: 'Выберите удобное для вас время',
                action: () {
                  print('Confim');
                }),
          ],
        ),
      ),
    );
  }
}
