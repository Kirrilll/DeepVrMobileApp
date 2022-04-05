import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'game_type_view_model.dart';

//Возможно для образования единных интерфейсов стоит вынести PageState(PageLoadingDataStae)\
// и создат стэйт связынный с законченностью страницы (аштшырувб гташтшыпув)

//Для достоверной информации является listner gameViewModel, обновляет selectedGame
class GamesViewModel with ChangeNotifier implements IBookingViewModel{

  GameModel? _selectedGame;
  GameModel? get selectedGame => _selectedGame;
  final _gameTypeModel = locator<GameTypeViewModel>();


  //Может сделать как CounterViewModel
  GamesViewModel(){
    _gameTypeModel.addListener(() {
      if(selectedGame != null){
        if (_gameTypeModel.selectedType != null && _gameTypeModel.selectedType?.id != _selectedGame?.gameType.id){
          _selectedGame = null;
          notifyListeners();
        }
      }
    });
  }

  @override
  bool isFinished(){
    if(_selectedGame == null) return false;
    return true;
  }

  void setSelectedGame(GameModel game){
    _selectedGame = game;
    notifyListeners();
  }

  @override
  IBookingViewModel? getNext() {
    return locator<CounterViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return _gameTypeModel;
  }

  @override
  int getPageNumber() {
    return 1;
  }


}
