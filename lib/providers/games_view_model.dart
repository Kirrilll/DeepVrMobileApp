import 'package:deepvr/models/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'game_type_view_model.dart';

//Возможно для образования единных интерфейсов стоит вынести PageState(PageLoadingDataStae)\
// и создат стэйт связынный с законченностью страницы (аштшырувб гташтшыпув)

//Для достоверной информации является listner gameViewModel, обновляет selectedGame


class GamesViewModel with ChangeNotifier implements IBookingViewModel{

  @override
  bool isFinished(Booking booking){
    if(booking.selectedGame == null) return false;
    return true;
  }

  @override
  IBookingViewModel? getNext() {
    return locator<CounterViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<GameTypeViewModel>();
  }

  @override
  int getPageNumber() {
    return 1;
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
