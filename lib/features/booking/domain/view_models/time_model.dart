import 'package:deepvr/core/di/locator.dart';
import 'package:deepvr/features/booking/usecases/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/services/booking_service.dart';
import 'package:deepvr/features/booking/usecases/updating_keys.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/models/time.dart';

class TimeModel with ChangeNotifier implements IBookingModel{

  final BookingService _bookingService = locator<BookingService>();


  TimeModel(){
    _bookingService.addListener(() {
      switch(_bookingService.updatingKey){
        case calendarKey:
          selectTime(null);
          break;
        case cascadeUpdateKey:
          notifyListeners();
      }
    });
  }

  Time? get selectedTime => _bookingService.booking.selectedTime;
  List<Time> get availableTime => _bookingService.booking.selectedDate?.availableTime ?? List.empty();

  void selectTime(Time? time){
    _bookingService.updateBooking(_bookingService.booking..selectedTime = time, getUpdatingKey());
    notifyListeners();
  }

  @override
  bool isFinished() => selectedTime != null;

  @override
  void onNext() {
    return;
  }

  @override
  Future<void> onNextAsync() async {
    return;
  }

  @override
  String getUpdatingKey() => timeKey;

}