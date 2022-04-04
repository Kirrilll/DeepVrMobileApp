import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:flutter/cupertino.dart';

//Возможно здесь будет USER вместо этого всего
class BookingFormViewModel implements IBookingViewModel{

  String? name;
  String? phoneNumber;


  @override
  IBookingViewModel? getNext() {
    // TODO: implement getNext
    throw UnimplementedError();
  }

  @override
  IBookingViewModel? getPrev() {
    // TODO: implement getPrev
    throw UnimplementedError();
  }

  @override
  bool isFinished() {
    if(name == null || phoneNumber == null) return false;
    return true;
  }


}