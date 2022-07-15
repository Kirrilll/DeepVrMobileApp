import 'dart:developer';

import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class TimeViewModel implements IBookingViewModel{

  @override
  IBookingViewModel? getNext() {
    return locator<BookingFormViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<DateViewModel>();
  }

  @override
  bool isFinished(Booking booking) {
    if(booking.selectedTime == null) return false;
    return true;
  }

  @override
  int getPageNumber() {
    return 4;
  }

  @override
  Future<void> additionalFunc() async {
    // TODO: implement additionalFunc
  }

  @override
  bool isMayBack() {
    return true;
  }

}