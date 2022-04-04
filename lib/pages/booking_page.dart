import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page.dart';
import 'package:deepvr/locator.dart';
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
  const Booking({Key? key, required this.bookingController}) : super(key: key);

  final PageController bookingController;

  @override
  _BookingState createState() => _BookingState();
}

//Как-то через  StreamProvider сделать переходы
class _BookingState extends State<Booking> {

  //Стоит сделать переменную, которая хранит в себе BookingPage interface
  //Там getNExt, getPrev, там проверка

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          addAutomaticKeepAlives: false,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: widget.bookingController,
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
      ),
    );
  }
}
