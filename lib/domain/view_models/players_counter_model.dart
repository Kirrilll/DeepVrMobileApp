import 'package:deepvr/domain/view_models/base_booking_step_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/booking.dart';

class PlayerCounterModel extends BaseBookingStepModel{

  int get maxGuestCount => bookingModel.booking.selectedGame!.guestMax ?? bookingModel.booking.selectedType!.guestMax;
  int get minGuestCount => bookingModel.booking.selectedGame!.guestMax ?? bookingModel.booking.selectedType!.guestMin;
  int get guestCount => bookingModel.booking.guestCount!;
  bool get isCanBeShowed => bookingModel.booking.guestCount != null;


  _setCounterValue(int value){
    if(value <= maxGuestCount && value >= minGuestCount){
      bookingModel.updateBooking(Booking.copyWith(
          Booking.initial(),
          selectedType: bookingModel.booking.selectedType!,
          selectedGame: bookingModel.booking.selectedGame,
          guestCount:  value,
          phone: bookingModel.booking.phone,
          name: bookingModel.booking.name
      ));
    }
  }

  void increment() =>_setCounterValue(guestCount + 1);
  void decrement() => _setCounterValue(guestCount-1);
}