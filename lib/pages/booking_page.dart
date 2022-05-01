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
import 'package:deepvr/widgets/custom_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import '../booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import '../booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import '../booking_page_widgets/booking_pages/time_picker_page/time_picker_page.dart';
import '../booking_page_widgets/default_button.dart';
import '../models/game_type_model.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

//Как-то через  StreamProvider сделать переходы
class _BookingPageState extends State<BookingPage> {
  //Стоит сделать переменную, которая хранит в себе BookingPage interface
  //Там getNExt, getPrev, там проверка
  late PageController bookingController;

  @override
  void initState() {
    bookingController = PageController(
        initialPage: locator<BookingModel>().currModel.getPageNumber());
    super.initState();
  }

  String _buildNextText(IBookingViewModel currModel) {
    switch (currModel.runtimeType) {
      case BookingFormViewModel:
        {
          return 'Отправить';
        }
      case BookingResultsViewModel:
        {
          return 'Забронировать';
        }
      default:
        return 'Далее';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: locator<BookingModel>(),
        child: Consumer<BookingModel>(builder: (context, model, _) {
          return Scaffold(
            body: CustomStepper(
              type: StepperType.horizontal,
              currentStep: model.currModel.getPageNumber(),
              steps: [
                const Step(title: Text(""), content: GameTypesPage()),
                Step(title: const Text(""), content: GameCardPage()),
                const Step(
                  title: Text(""),
                  content: PlayersCounterPage(),
                ),
                const Step(title: Text(""), content: TimePickerPage()),
                const Step(title: Text(""), content: DatePickerPage()),
              ],
              onStepContinue: model.currModel.isFinished(model.booking)
                  ? () {
                      FocusScope.of(context).unfocus();
                      if (model.currModel.runtimeType !=
                          BookingResultsViewModel) {
                        model.setViewModel(
                            model.currModel.getNext() ?? model.currModel);
                      } else {
                        locator<BookingResultsViewModel>().order();
                        model.init();
                      }
                    }
                  : null,
              onStepCancel: model.currModel.isMayBack()
                  ? () {
                      FocusScope.of(context).unfocus();
                      model.setViewModel(
                          model.currModel.getPrev() ?? model.currModel);
                    }
                  : null,
              controlsBuilder: (context, details) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration:  BoxDecoration(
                      boxShadow: const [BoxShadow(color: Color(0xFF1F2032), offset: Offset(0, 1))],
                    color: Theme.of(context).colorScheme.background
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: details.onStepCancel,
                          child: Text('Назад'),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),

                                  gradient: const LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                onSurface: Theme.of(context).colorScheme.onSurface,
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                              onPressed: details.onStepContinue,
                              child: const Text("Далее", softWrap: false),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            // body: ListView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   addAutomaticKeepAlives: false,
            //   scrollDirection: Axis.horizontal,
            //   controller: bookingController,
            //   children: [
            //     const GameTypesPage(),
            //     GameCardPage(),
            //     const PlayersCounterPage(),
            //     const DatePickerPage(),
            //     const TimePickerPage(),
            //     const FormPage(),
            //     const BookingResultPage()
            //   ],
            // ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,
            // floatingActionButton: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       DefaultButton(
            //           action: () => model.currModel.isMayBack()
            //               ? () {
            //             FocusScope.of(context).unfocus();
            //             model.setViewModel(model.currModel.getPrev() ?? model.currModel);
            //             bookingController.previousPage(
            //                 duration: const Duration(milliseconds: 300),
            //                 curve: Curves.ease);
            //           }
            //               : null,
            //           text: 'Назад'
            //       ),
            //       DefaultButton(
            //           action: () => model.currModel.isFinished(model.booking)
            //               ? () async {
            //             FocusScope.of(context).unfocus();
            //             if(model.currModel.runtimeType != BookingResultsViewModel){
            //               model.setViewModel(
            //                   model.currModel.getNext() ?? model.currModel);
            //               await bookingController.nextPage(
            //                   duration: const Duration(milliseconds: 300),
            //                   curve: Curves.ease);
            //             }
            //             else{
            //               locator<BookingResultsViewModel>().order();
            //               model.init();
            //             }
            //           }
            //           : null,
            //           text: _buildNextText(model.currModel)
            //       )
            //     ],
            //   ),
            // ),
          );
        }),
      ),
    );
  }
}
