import 'dart:core';
import 'package:deepvr/domain/models/booking.dart';
import 'package:flutter/material.dart';


class BookingService with ChangeNotifier{
  String _updatingKey = '';
  Booking _booking = Booking.initial();


  Booking get booking => _booking;
  String get updatingKey => _updatingKey;

  void updateBooking(Booking booking, String updatingKey){
    _updatingKey = updatingKey;
    _booking = booking;
    notifyListeners();
  }
}