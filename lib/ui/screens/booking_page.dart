import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page/order_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page/result_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page/suc%D1%81essful_page.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/ui/widgets/useful_widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import '../../booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import '../../booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import '../views/time_picker_step.dart';
import '../widgets/custom_widgets/custom_stepper.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

//TODO внедрить BookingBase в Step
//Как-то через  StreamProvider сделать переходы
class _BookingPageState extends State<BookingPage> {
  //Стоит сделать переменную, которая хранит в себе BookingPage interface
  //Там getNExt, getPrev, там проверка


  VoidCallback _onStepContinue(BookingModel model) {
    return () {
      FocusScope.of(context).unfocus();
      model.currModel.additionalFunc();
      if(model.currModel.getNext()!= null){
        setState(() {
          selectedIndex++;
        });
      }
      model.setViewModel(model.currModel.getNext() ?? model.currModel);
    };
  }

  VoidCallback? _onStepCancel(BookingModel model) {
    return model.currModel.isMayBack()
        ? () {
            FocusScope.of(context).unfocus();
            if(model.currModel.getPrev()!= null){
              setState(() {
                selectedIndex--;
              });
              model.setViewModel(model.currModel.getPrev()!);
            }
          }
        : null;
  }

  bool _isResultPage(IBookingViewModel model) {
    return model.runtimeType == BookingResultsViewModel;
  }
  //Это костыль, как можно раньше убрать это
  bool _isControlsEnabled(IBookingViewModel model) {
    if (!_isResultPage(model) && selectedIndex == 6) return false;
    return true;
  }

  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = locator<BookingModel>().currModel.getPageNumber();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingModel>(),
      child: Consumer<BookingModel>(builder: (context, model, _) {
        return CustomStepper(
          type: StepperType.horizontal,
          currentStep: selectedIndex,
          steps: [
            const Step(title: Text(""), content: GameTypesPage()),
            Step(title: const Text(""), content: GameCardPage()),
            const Step(title: Text(""), content: PlayersCounterPage()),
            const Step(title: Text(""), content: DatePickerPage()),
            const Step(title: Text(""), content: TimePickerStep()),
            const Step(title: Text(""), content: FormPage()),
            const Step(title: Text(''), content: BookingResultPage(), state: StepState.disabled)
          ],
          onStepContinue: _onStepContinue(model),
          onStepCancel: _onStepCancel(model),
          controlsBuilder: _isControlsEnabled(model.currModel)
              ? (context, details) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(color: Color(0xFF1F2032), offset: Offset(0, 1))
                    ], color: Theme.of(context).colorScheme.background),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CancelStepButton(onStepCancel: details.onStepCancel),
                        const SizedBox(width: 9),
                        DefaultButton(
                          actTitle: _isResultPage(model.currModel)
                              ? 'Готово'
                              : "Далее",
                          actionCallback: details.onStepContinue,
                          isActive: model.currModel.isFinished(model.booking),
                        )
                      ],
                    ),
                  );
                }
              : null,
        );
      }),
    );
  }
}

class CancelStepButton extends StatelessWidget {
  const CancelStepButton({Key? key, required this.onStepCancel})
      : super(key: key);

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
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                child: Text('Назад'),
              ),
            ),
          )),
    );
  }
}