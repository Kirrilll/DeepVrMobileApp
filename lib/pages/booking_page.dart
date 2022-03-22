import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class _BookingState extends State<Booking> {
  GameTypeModel? _chosenType;
  final pageController = PageController();

  late int count;

  @override
  void initState() {
    super.initState();
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
              GameTypesPage(setGameType: (id) {}),
              PlayersCounterPage(
                  count: count,
                  setCount: (int value) {
                    setState(() {
                      count = value;
                    });
                  },
                  maxPlayers: _chosenType!.guestMax,
                  minPlayers: _chosenType!.guestMin),
              GameCardPage(
                gameTypeId: 2,
                setGame: (id) {
                  print('sfsf');
                },),
              TimePickerPage(
                setTime: (id) => print(id),
              ),
              //const DatePickerPage()
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
                    onPressed:  () => pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease),
                  ),
                  label: 'adad'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.album),
                  label: 'home'
              ),
              BottomNavigationBarItem(
                  icon: IconButton(
                    iconSize: 24,
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease),
                  ),
                  label: 'adad'),
            ],
          )),
    );
  }
}