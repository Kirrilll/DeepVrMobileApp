import 'package:deepvr/domain/models/booking_step.dart';
import 'package:deepvr/features/booking/usecases/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/usecases/updating_keys.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/usecases/configurations/booking_step_config.dart';
import '../services/booking_service.dart';

class BookingModel with ChangeNotifier {
  int _stepIndex = 0;
  final BookingConfiguration _bookingConfiguration = locator<BookingConfiguration>();
  final _bookingService = locator<BookingService>();

  BookingModel(){
    _bookingService.addListener(() {
      if(_bookingService.updatingKey == cascadeUpdateKey){
        print(_getLastFinishedStep());
        stepIndex = _getLastFinishedStep();
      }
    });
  }

  List<BookingStep> get steps => _bookingConfiguration.bookingSteps;
  int get stepIndex => _stepIndex;
  IBookingModel get viewModel => steps[_stepIndex].viewModel;
  bool get isLast => _stepIndex == steps.length-1;
  bool get isFirst => _stepIndex == 0;

  set stepIndex(int index) {
    if (index >= 0 && index <= steps.length - 1) {
      _stepIndex = index;
      notifyListeners();
    }
  }

  VoidCallback buildOnStepContinue(BuildContext context) {
    return () {
      FocusScope.of(context).unfocus();
      viewModel.onNext();
      viewModel.onNextAsync();
      stepIndex = _stepIndex + 1;
    };
  }

  VoidCallback? buildOnStepCancel(BuildContext context) {
    return stepIndex > 0
        ? () {
            FocusScope.of(context).unfocus();
            stepIndex = _stepIndex - 1;
          }
        : null;
  }

  int _getLastFinishedStep(){
    int lastIndex = steps.lastIndexWhere((step) => step.viewModel.isFinished());
    return lastIndex >= 0
        ? lastIndex
        : 0;
  }
}
