import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:flutter/cupertino.dart';

//Возможно здесь будет USER вместо этого всего
class BookingFormViewModel implements BaseBookingViewModel{

  String? name;
  String? phoneNumber;


  @override
  BaseBookingViewModel? getNext() {
    // TODO: implement getNext
    throw UnimplementedError();
  }

  @override
  BaseBookingViewModel? getPrev() {
    // TODO: implement getPrev
    throw UnimplementedError();
  }

  @override
  bool isFinished() {
    if(name == null || phoneNumber == null) return false;
    return true;
  }


}