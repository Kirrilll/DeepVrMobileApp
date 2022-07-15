import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/ui/shared/default_button.dart';
import 'package:deepvr/usecases/configurations/booking_step_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_stepper.dart';

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
      // model.currModel.additionalFunc();
      model.next();
    };
  }

  VoidCallback? _onStepCancel(BookingModel model) {
    return model.mayBack
        ? () {
            FocusScope.of(context).unfocus();
            model.back();
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingModel>(),
      child: Consumer<BookingModel>(builder: (context, model, _) {
        return CustomStepper(
          type: StepperType.horizontal,
          currentStep: model.currStepIndex,
          steps: bookingSteps,
          onStepContinue: _onStepContinue(model),
          onStepCancel: _onStepCancel(model),
          controlsBuilder: model.steps[model.currStepIndex].isControlPanelShow
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
                        Expanded(
                          child: DefaultButton(
                            actTitle:
                                model.currStepIndex == model.steps.length - 1
                                    ? 'Готово'
                                    : "Далее",
                            actionCallback: details.onStepContinue,
                            isActive: model.mayNext,
                          ),
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
