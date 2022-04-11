import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';

class BookingModel with ChangeNotifier{
  //Храним все выбранное
  //Должен знать какая сейчас страница
  late Booking booking;
  //Переделать currModel
  late IBookingViewModel currModel;


  BookingModel(){
    init();
  }

  void setViewModel(IBookingViewModel viewModel){
    currModel = viewModel;
    notifyListeners();
  }


  void updateBooking(Booking booking){
    this.booking = booking;
    notifyListeners();
  }

  //функция, которая делаем booking не
  void init(){
    updateBooking(Booking.initial());
    currModel = locator<GameTypeViewModel>();
  }

  }


