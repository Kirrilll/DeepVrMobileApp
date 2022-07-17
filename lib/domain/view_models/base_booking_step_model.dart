import 'package:deepvr/locator.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:flutter/cupertino.dart';

class BaseBookingStepModel{
  late BookingModel bookingModel;

  void init(BookingModel model){
   bookingModel = model;
  }

  bool isFinished() => true;

  //Либо здесь если ассинхронно
  Future<bool> onNextAsync(){
    return Future.sync(() => true);
  }
  //Здесь запись в Booking
  void onNext(){}
}