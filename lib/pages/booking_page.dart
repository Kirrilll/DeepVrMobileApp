import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page/result_page.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import '../booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import '../booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import '../booking_page_widgets/booking_pages/time_picker_page/time_picker_page.dart';
import '../models/game_type_model.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

//TODO сделать преключатель, кнопку или что-то типа этого

//Как-то через  StreamProvider сделать переходы
class _BookingPageState extends State<BookingPage> {
  //Стоит сделать переменную, которая хранит в себе BookingPage interface
  //Там getNExt, getPrev, там проверка
  late PageController bookingController;

  @override
  void initState() {
    print('init booking');
    print(locator<BookingModel>().currModel.getPageNumber());
    bookingController = PageController(
        initialPage: locator<BookingModel>().currModel.getPageNumber());
    super.initState();
  }

  String _buildNextText(IBookingViewModel currModel){
    switch(currModel.runtimeType){
      case BookingFormViewModel:{
        return 'Отправить';
      }
      case BookingResultsViewModel:{
        return 'Забронировать';
      }
      default: return 'Далее';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: locator<BookingModel>(),
        child: Consumer<BookingModel>(builder: (context, model, _) {
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
                    onPressed: model.currModel.isMayBack()
                        ? () {
                            FocusScope.of(context).unfocus();
                            model.currModel.additionalFunc();
                            model.setViewModel(
                                model.currModel.getPrev() ?? model.currModel);
                            bookingController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          }
                        : null,
                    child: const Text(
                      'Назад',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        primary: Theme.of(context).colorScheme.secondary,
                        onSurface: Theme.of(context).colorScheme.onSurface,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  ElevatedButton(
                    onPressed: model.currModel.isFinished(model.booking)
                        ? () async {
                            FocusScope.of(context).unfocus();
                            if(model.currModel.runtimeType != BookingResultsViewModel){
                              model.setViewModel(
                                  model.currModel.getNext() ?? model.currModel);
                              await bookingController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            }
                            else{
                              locator<BookingResultsViewModel>().order();
                              model.init();
                            }
                          }
                        : null,
                    child:  Text(
                      _buildNextText(model.currModel),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      primary: Theme.of(context).colorScheme.secondary,
                      onSurface: Theme.of(context).colorScheme.onSurface,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
