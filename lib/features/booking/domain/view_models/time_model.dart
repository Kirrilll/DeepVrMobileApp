import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/features/booking/domain/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/services/booking_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/models/time.dart';
import 'calendar_model.dart';

class TimeModel with ChangeNotifier implements IBookingModel{

  final BookingService _bookingService = locator<BookingService>();


  TimeModel(){
    _bookingService.addListener(() {
      if(_bookingService.lastChangeItemName is CalendarModel){
        selectTime(null);
      }
    });
  }

  Time? get selectedTime => _bookingService.booking.selectedTime;
  List<Time> get availableTime => _bookingService.booking.selectedDate?.availableTime ?? List.empty();

  void selectTime(Time? time){
    _bookingService.updateBooking(_bookingService.booking..selectedTime = time, this);
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

}