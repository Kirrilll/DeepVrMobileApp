import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form_page.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/widgets/custom_stepper.dart';
import 'package:deepvr/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import '../booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import '../booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import '../booking_page_widgets/booking_pages/time_picker_page/time_picker_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

//Как-то через  StreamProvider сделать переходы
class _BookingPageState extends State<BookingPage> {
  //Стоит сделать переменную, которая хранит в себе BookingPage interface
  //Там getNExt, getPrev, там проверка

  VoidCallback _onStepContinue(BookingModel model) {
    return () {
            FocusScope.of(context).unfocus();
            model.setViewModel(model.currModel.getNext() ?? model.currModel);
          };
  }

  VoidCallback? _onStepCancel(BookingModel model) {
    return model.currModel.isMayBack()
        ? () {
            FocusScope.of(context).unfocus();
            model.setViewModel(model.currModel.getPrev() ?? model.currModel);
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingModel>(),
      child: Consumer<BookingModel>(builder: (context, model, _) {
        return  CustomStepper(
            type: StepperType.horizontal,
            currentStep: model.currModel.getPageNumber(),
            steps: [
              const Step(title: Text(""), content: GameTypesPage()),
              Step(title: const Text(""), content: GameCardPage()),
              const Step(title: Text(""), content: PlayersCounterPage()),
              const Step(title: Text(""), content: DatePickerPage()),
              const Step(title: Text(""), content: TimePickerPage()),
              const Step(title: Text(""), content: FormPage()),
            ],
            onStepContinue: _onStepContinue(model),
            onStepCancel: _onStepCancel(model),
            controlsBuilder: (context, details) {
              return Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(color: Color(0xFF1F2032), offset: Offset(0, 1))],
                    color: Theme.of(context).colorScheme.background),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CancelStepButton(onStepCancel: details.onStepCancel),
                    const SizedBox(width: 9),
                    DefaultButton(
                      actTitle: "Далее",
                      actionCallback: details.onStepContinue,
                      isActive: model.currModel.isFinished(model.booking),
                    )
                  ],
                ),
              );
            },
          );
      }),
    );
  }
}


class CancelStepButton extends StatelessWidget {
  const CancelStepButton({
    Key? key,
    required this.onStepCancel
  }) : super(key: key);

  final void Function()? onStepCancel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          onPressed: onStepCancel,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFF36C0E7),
                  Color(0xFF4B51EA),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Center(
                child: Text('Назад'),
              ),
            ),
          )
      ),
    );
  }
}


