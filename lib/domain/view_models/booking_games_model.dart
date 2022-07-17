import 'package:deepvr/data/entities/game.dart';
import 'package:deepvr/domain/view_models/base_booking_step_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/booking.dart';

class BookingGamesModel extends BaseBookingStepModel{

  @override
  bool isFinished() => bookingModel.booking.selectedGame != null;

  void setSelectedGame(Game? game){
    bookingModel.updateBooking(Booking.copyWith(
        Booking.initial(),
        selectedType: bookingModel.booking.selectedType!,
        selectedGame: game,
        guestCount:  game?.guestMin ?? game!.gameType.guestMin,
        phone: bookingModel.booking.phone,
        name: bookingModel.booking.name
    ));
  }
}