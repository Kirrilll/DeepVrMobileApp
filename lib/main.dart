import 'package:deepvr/page_widgets/booking_page_maket.dart';
import 'package:deepvr/page_widgets/booking_pages/form_page/form.dart';
import 'package:deepvr/page_widgets/booking_pages/game_type_page/game_type_container.dart';
import 'package:deepvr/page_widgets/booking_pages/players_counter_page/players_counter.dart';
import 'package:deepvr/page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import 'package:deepvr/page_widgets/booking_pages/time_picker_page/time_picker.dart';
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

  int minPlayers = 4;
  int maxPlayers = 10;

  final pageController = PageController();

  late int count;

  @override
  void initState() {
    super.initState();
    count = minPlayers;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: [
            PlayersCounterPage(
                count: count,
                page: 0,
                pagesLength: 3,
                setCount: (int value){
                  setState(() {
                    count = value;
                  });
                },
                pageController: pageController,
                maxPlayers: maxPlayers,
                minPlayers: minPlayers
            ),
            BookingPageMaket(
              stepNumber: 2,
              content: const OrderingForm(),
              stepTitle: 'Выберите удобный для вас день',
              action: () {
                pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut);
              },
            ),
            BookingPageMaket(
                stepNumber: 3,
                content: GameTypeContainer(),
                stepTitle: 'Выберите VR Зал',
                action: () {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                }
            ),
            BookingPageMaket(
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
