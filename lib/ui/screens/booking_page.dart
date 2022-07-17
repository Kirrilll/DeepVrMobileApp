import 'package:deepvr/locator.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/ui/shared/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_stepper.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}


class _BookingPageState extends State<BookingPage> {
   final BookingModel _bookingModel = locator<BookingModel>();

  VoidCallback _onStepContinue() {
    return () {
      FocusScope.of(context).unfocus();
      _bookingModel.next();
    };
  }

  VoidCallback? _onStepCancel() {
    return _bookingModel.mayBack
        ? () {
            FocusScope.of(context).unfocus();
            _bookingModel.back();
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingModel>(),
      child: Selector<BookingModel, int>(
        selector: (_, model) => model.currStepIndex,
          builder: (context, stepIndex, _) {
        return CustomStepper(
          type: StepperType.horizontal,
          currentStep: stepIndex,
          steps: _bookingModel.steps,
          onStepContinue: _onStepContinue(),
          onStepCancel: _onStepCancel(),
          controlsBuilder: _bookingModel.steps[stepIndex].isControlPanelShow
              ? (context, details) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(color: Color(0xFF1F2032), offset: Offset(0, 1))
                    ], color: Theme.of(context).colorScheme.background),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CancelStepButton(onStepCancel: details.onStepCancel),
                        const SizedBox(width: 9),
                        Selector<BookingModel, bool>(
                          selector: (_, model) => model.mayNext,
                          builder: (_, mayNext, __) => Expanded(
                            child: DefaultButton(
                              actTitle:
                              stepIndex == _bookingModel.steps.length - 1
                                      ? 'Готово'
                                      : "Далее",
                              actionCallback: details.onStepContinue,
                              isActive: mayNext,
                            ),
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
