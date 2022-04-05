import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'booking_results_view_model.dart';

//Возможно здесь будет USER вместо этого всего
class BookingFormViewModel implements IBookingViewModel{

  String? name;
  String? phoneNumber;


  @override
  IBookingViewModel? getNext() {
    return locator<BookingResultsViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<TimeViewModel>();
  }

  @override
  bool isFinished() {
    //if(name == null || phoneNumber == null) return false;
    return true;
  }

  @override
  int getPageNumber() {
    return 5;
  }


}