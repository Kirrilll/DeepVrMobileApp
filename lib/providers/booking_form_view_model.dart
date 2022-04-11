import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'booking_results_view_model.dart';

//Возможно здесь будет USER вместо этого всего
class BookingFormViewModel implements IBookingViewModel{

  late GlobalKey<FormState> _formState;

  void setFormState(GlobalKey<FormState> formState){
    _formState = formState;
  }
  GlobalKey<FormState> get formState => _formState;


  @override
  IBookingViewModel? getNext() {
    return locator<BookingResultsViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<TimeViewModel>();
  }

  @override
  bool isFinished(Booking booking) {
    if(booking.name == null || booking.phone == null) return false;
    return true;
  }

  @override
  int getPageNumber() {
    return 5;
  }

  @override
  Future<void> additionalFunc() async {
    if(_formState.currentState!.validate()) {
          _formState.currentState?.save();
        }
  }

  @override
  bool isMayBack() {
    return true;
  }



}