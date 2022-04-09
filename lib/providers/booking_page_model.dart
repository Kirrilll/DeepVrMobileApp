import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class BookingPageModel with ChangeNotifier{
  //GameType  - стартовая страница
  IBookingViewModel _currViewModel = locator<GameTypeViewModel>();

  IBookingViewModel get currPage => _currViewModel;

  void setViewModel(IBookingViewModel model){
    _currViewModel = model;
    notifyListeners();
  }
}