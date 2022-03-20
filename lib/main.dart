import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_card_container.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_container.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/players_counter_page/players_counter.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker.dart';
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

  //TabController tabController = new TabController(length: 2, vsync: );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: [
            GameTypesPage(setGameType: (id){}),
            PlayersCounterPage(
                count: count,
                page: 1,
                setCount: (int value){
                  setState(() {
                    count = value;
                  });
                },
                maxPlayers: maxPlayers,
                minPlayers: minPlayers
            ),
          GameCardPage(gameTypeId: 0, setGame: (id){print('sfsf');}, pageController: pageController)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  iconSize: 24,
                  icon: const Icon( Icons.arrow_back),
                  onPressed: () => pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease
                  ),
                ),
              label: 'adad'
            ),
            BottomNavigationBarItem(
                icon: IconButton(
                  iconSize: 24,
                  icon: const Icon( Icons.arrow_forward),
                  onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease
                  ),
                ),
                label: 'adad'
            ),
          ],
        )
      ),
    );
  }
}
