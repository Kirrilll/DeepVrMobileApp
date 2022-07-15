

import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/models/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../data/services/booking_service.dart';

enum PageState{
  unLoaded,
  loaded,
  failed,
}


class GameTypeViewModel with ChangeNotifier implements IBookingViewModel{

  PageState _pageState = PageState.unLoaded;
  List<GameType>? _gameTypes;

  PageState get pageState => _pageState;
  List<GameType>? get gameTypes => _gameTypes;


  //обрабатывать 404 error
  Future<void> getTypes() async{
    _gameTypes = await locator<BookingService>().getGameTypes();
    _pageState = PageState.loaded;
    notifyListeners();
  }

  @override
  IBookingViewModel? getNext() {
    return locator<GamesViewModel>();
  }

  @override
  IBookingViewModel? getPrev() => null;

  @override
  bool isFinished(Booking booking) {
      if(booking.selectedType == null) return false;
      return true;
  }

  @override
  int getPageNumber() {
    return 0;
  }

  @override
  Future<void> additionalFunc() async {
    // TODO: implement additionalFunc
  }

  @override
  bool isMayBack() {
    return false;
  }
}