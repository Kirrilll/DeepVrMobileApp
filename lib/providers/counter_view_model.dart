import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class CounterViewModel implements IBookingViewModel{


  @override
  bool isFinished(Booking booking) => true;

  @override
  IBookingViewModel? getNext() {
    return locator<DateViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<GamesViewModel>();
  }

  @override
  int getPageNumber() {
    return 2;
  }

  @override
  Future<void> additionalFunc() async {
    // TODO: implement additionalFunc
  }

  @override
  bool isMayBack() {
    return true;
  }
}