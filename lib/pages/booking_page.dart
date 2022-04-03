import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/booking_provider.dart';
import 'package:deepvr/providers/booking_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import '../booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import '../booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import '../booking_page_widgets/booking_pages/time_picker_page/time_picker_page.dart';
import '../models/game_type_model.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

//Как-то через  StreamProvider сделать переходы
class _BookingState extends State<Booking> {
  final pageController = PageController();
  final bookingViewModel = locator<BookingViewModel>();
  //Стоит сделать переменную, которая хранит в себе BookingPage interface
  //Там getNExt, getPrev, там проверка

  @override
  Widget build(BuildContext context) {
    print(bookingViewModel.activeViewModel.isFinished());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locator<GameTypeViewModel>()),
        ChangeNotifierProvider.value(value: locator<GamesViewModel>()),
        ChangeNotifierProvider.value(value: locator<CounterViewModel>()),
        ChangeNotifierProvider(create: (context) => BookingProvider())
      ],
      child: SafeArea(
        child: Scaffold(
            body: ListView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: pageController,
              children: const [
                GameTypesPage(),
                GameCardPage(),
                PlayersCounterPage(),
                DatePickerPage(),
                TimePickerPage(),
                FormPage(),
                BookingResultPage()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 1,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      iconSize: 24,
                      icon: const Icon(Icons.arrow_back),
                      onPressed:  () {
                              pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            }
                    ),
                    label: 'adad'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.album), label: 'home'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.widgets), label: 'games'),
                BottomNavigationBarItem(
                    icon: IconButton(
                      iconSize: 24,
                      icon: const Icon(Icons.arrow_forward),
                      onPressed:   () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            }
                    ),
                    label: 'adad'),
              ],
            )),
      ),
    );
  }
}
