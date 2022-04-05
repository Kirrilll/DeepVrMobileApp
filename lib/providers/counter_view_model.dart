import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class CounterViewModel with ChangeNotifier implements IBookingViewModel{
  final GamesViewModel _gamesViewModel = locator<GamesViewModel>();

  late int _guestMax;
  late int _guestMin;
  late int _guestCount;
  //Переменая контролирующая, можно ли страницу рендерит
  bool _isAvailable = false;

  int get guestCount => _guestCount;
  bool get isAvailable => _isAvailable;



  //У GamesViewModel notify срабатывает при выборе game
  CounterViewModel(){
      _gamesViewModel.addListener(() {
        if(_gamesViewModel.isFinished()){
          _guestMax = _gamesViewModel.selectedGame?.guestMax ?? _gamesViewModel.selectedGame!.gameType.guestMax;
          _guestMin = _gamesViewModel.selectedGame?.guestMin ?? _gamesViewModel.selectedGame!.gameType.guestMin;
          _guestCount = _guestMin;
          _isAvailable = true;
        }
        else{
          _isAvailable = false;
        }
        notifyListeners();
      });
  }

  void increment(){
    if(_guestCount < _guestMax){
      _guestCount = _guestCount +1;
      notifyListeners();
    }
  }

  void decrement(){
    if(_guestCount > _guestMin){
      _guestCount = _guestCount -1;
      notifyListeners();
    }
  }
  @override
  bool isFinished() => true;

  @override
  IBookingViewModel? getNext() {
    return locator<DateViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return _gamesViewModel;
  }

  @override
  int getPageNumber() {
    return 2;
  }
}