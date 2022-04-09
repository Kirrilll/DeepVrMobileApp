import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page/result_page.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/booking_page_model.dart';
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

//TODO сделать преключатель, кнопку или что-то типа этого

//Как-то через  StreamProvider сделать переходы
class _BookingState extends State<Booking> {
  //Стоит сделать переменную, которая хранит в себе BookingPage interface
  //Там getNExt, getPrev, там проверка
  late PageController bookingController;

  //TODO в BookingPageModel создать функцию сброса, хранить ТАМ выбранное, остальное подгружать

  @override
  void initState() {
    bookingController = PageController(initialPage: locator<BookingPageModel>().currPage.getPageNumber());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: locator<BookingPageModel>(),
        child: Consumer<BookingPageModel>(
          builder: (context, model, _)
          {
            print('build');
                 return Scaffold(
                    body: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      addAutomaticKeepAlives: false,
                      scrollDirection: Axis.horizontal,
                      controller: bookingController,
                      children: [
                        const GameTypesPage(),
                        GameCardPage(),
                        const PlayersCounterPage(),
                        const DatePickerPage(),
                        const TimePickerPage(),
                        const FormPage(),
                        const BookingResultPage()
                      ],
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                    floatingActionButton: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: model.currPage.getPageNumber() != 0
                                ? () {
                                    model.setViewModel(
                                        model.currPage.getPrev() ??
                                            model.currPage);
                                    bookingController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  }
                                : null,
                            child: const Icon(
                              Icons.navigate_before,
                              color: Colors.black,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                primary:
                                    Theme.of(context).colorScheme.secondary,
                                onSurface:
                                    Theme.of(context).colorScheme.onSurface,
                                shape: const CircleBorder()),
                          ),
                          ElevatedButton(
                            onPressed: model.currPage.isFinished()
                                ? () {
                                    print('sfsf');
                                    model.setViewModel(
                                        model.currPage.getNext() ??
                                            model.currPage);
                                    bookingController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  }
                                : null,
                            child: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                primary:
                                    Theme.of(context).colorScheme.secondary,
                                onSurface:
                                    Theme.of(context).colorScheme.onSurface,
                                shape: const CircleBorder()),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
