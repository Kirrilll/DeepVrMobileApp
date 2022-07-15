import 'package:deepvr/models/booking.dart';
import 'package:flutter/cupertino.dart';

abstract class IBookingViewModel{

  IBookingViewModel? getNext();
  IBookingViewModel? getPrev();

  int getPageNumber();
  bool isFinished(Booking booking);
  bool isMayBack();

  Future<void> additionalFunc();
}