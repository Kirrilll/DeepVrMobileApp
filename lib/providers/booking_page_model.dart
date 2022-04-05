import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/game_type_view_model.dart';

import '../locator.dart';

class BookingPageModel{
  //GameType  - стартовая страница
  IBookingViewModel _currViewModel = locator<GameTypeViewModel>();

  IBookingViewModel get currPage => _currViewModel;

  set currViewModel(IBookingViewModel value) {
    _currViewModel = value;
  }

  bool next(){
    if(_currViewModel.isFinished()){
      _currViewModel = _currViewModel.getNext() ?? _currViewModel;
      return true;
    }
    return false;
  }

  void back() {
    _currViewModel = _currViewModel.getPrev() ?? _currViewModel;
  }
}