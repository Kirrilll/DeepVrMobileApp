

import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../services/remote_service.dart';

enum PageState{
  unLoaded,
  loaded,
  failed
}

class GameTypeViewModel with ChangeNotifier implements BaseBookingViewModel{

  GameTypeModel? _selectedType;
  PageState _pageState = PageState.unLoaded;
  List<GameTypeModel>? _gameTypes;

  GameTypeModel? get selectedType => _selectedType;
  PageState get pageState => _pageState;
  List<GameTypeModel>? get gameTypes => _gameTypes;


  void setSelectedType(GameTypeModel type){
    _selectedType = type;
    notifyListeners();
  }

  //обрабатывать 404 error
  void getTypes() async{
    _gameTypes = await RemoteService.getInstance().getGameTypes();
    _pageState = PageState.loaded;
    notifyListeners();
  }

  @override
  BaseBookingViewModel? getNext() {
    return locator<GamesViewModel>();
  }

  @override
  BaseBookingViewModel? getPrev() => null;

  @override
  bool isFinished() {
    if(_selectedType == null) return false;
    return true;
  }
}