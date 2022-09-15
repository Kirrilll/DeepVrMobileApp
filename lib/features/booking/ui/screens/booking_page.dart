import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/core/usecases/configurations/booking_step_config.dart';
import 'package:deepvr/core/ui/shared/default_button.dart';
import 'package:deepvr/features/booking/domain/interfaces/i_booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../domain/models/booking.dart';
import '../widgets/custom_stepper.dart';

//TODO срочно рефакторить
class BookingPage extends StatefulWidget {
  const BookingPage({Key? key, this.initialBooking}) : super(key: key);

  final Booking? initialBooking;
  //static final BookingModel _bookingModel = locator<BookingModel>();

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int stepIndex = 0;
  final BookingConfiguration _bookingConfiguration = locator<BookingConfiguration>();
  late final steps = _bookingConfiguration.bookingSteps;

  VoidCallback _onStepContinue(BuildContext context, IBookingModel model) {
    return () {
      FocusScope.of(context).unfocus();
      setState(() {
        if (stepIndex < steps.length - 1) {
          stepIndex++;
        }
      });
      model.onNext();
      model.onNextAsync();
    };
  }

  VoidCallback? _onStepCancel(BuildContext context) {
    return stepIndex > 0
        ? () {
            FocusScope.of(context).unfocus();
            setState(() {
              stepIndex--;
            });
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IBookingModel>.value(
      value: steps[stepIndex].viewModel,
      child: CustomStepper(
        type: StepperType.horizontal,
        currentStep: stepIndex,
        steps: steps,
        onStepContinue: _onStepContinue(context, steps[stepIndex].viewModel),
        onStepCancel: _onStepCancel(context),
        controlsBuilder: steps[stepIndex].isControlPanelShow
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
                      Selector<IBookingModel, bool>(
                        selector: (_, model) => model.isFinished(),
                        builder: (_, isFinished, __) => Expanded(
                          child: DefaultButton(
                              actTitle: stepIndex == steps.length - 1
                                  ? 'Готово'
                                  : "Далее",
                              actionCallback: details.onStepContinue,
                              isActive: isFinished
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            : null,
      ),
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
