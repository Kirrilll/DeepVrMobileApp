import 'dart:core';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/features/booking/data/entities/game_type.dart';
import 'package:deepvr/features/booking/domain/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/view_models/game_type_model.dart';
import 'package:flutter/material.dart';

//За авторизацией следит PersonalDataModel
//Каждая модель следуит за определнными параметрами обновления
class BookingService with ChangeNotifier{
  Booking _booking = Booking.initial();
  IBookingModel? _lastChangedModel;

  Booking get booking => _booking;
  IBookingModel? get lastChangeItemName => _lastChangedModel;


  void updateBooking(Booking booking, IBookingModel model){
    _booking = booking;
    _lastChangedModel = model;
    notifyListeners();
  }
}