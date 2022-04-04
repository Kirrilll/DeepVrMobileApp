import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:flutter/cupertino.dart';

class BookingViewModel with ChangeNotifier{
  IBookingViewModel _activeViewModel = locator<GameTypeViewModel>();

  IBookingViewModel get activeViewModel{
    print(_activeViewModel.isFinished());
    return _activeViewModel;
  }

  set activeViewModel(IBookingViewModel value) {
    _activeViewModel = value;
    notifyListeners();
  }
}