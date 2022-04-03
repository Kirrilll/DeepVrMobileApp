
import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/models/booking_date_model/booking_date_model.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../entities/time_entity.dart';

//enum, показывающий какая на данный этап страница активна
//изначально GAME_TYPE

//Это менеджит что все то что selected
//Возможно сделать это просто большим хранилищем
class BookingProvider with ChangeNotifier{

  GameTypeModel? _selectedGameType;
  List<GameTypeModel>? _gameTypes;
  var _isLoadedGameType = false;

  GameModel? _selectedGame;

  int? _guestCount;
  late int _guestMin;
  late int _guestMax;

  BookingDateModel? _bookingDateModel;
  var _isLoadedDate = false;
  DateEntity? _selectedDate;

  TimeEntity? _selectedTime;

  bool get isLoadedGameType => _isLoadedGameType;
  List<GameTypeModel>? get gameTypes => _gameTypes;
  GameTypeModel? get selectedGameType => _selectedGameType;

  GameModel? get selectedGame => _selectedGame;

  int get guestCount =>  _guestCount!;

  BookingDateModel? get bookingDateModel => _bookingDateModel;
  bool get isLoadedDate => _isLoadedDate;

  DateEntity? get selectedDate => _selectedDate;

  TimeEntity? get selectedTime => _selectedTime;

  void increment(){
    if(_guestCount! < _guestMax){
      _guestCount = _guestCount! +1;
      notifyListeners();
    }
  }

  void decrement(){
    if(_guestCount! > _guestMin){
      _guestCount = _guestCount! -1;
      notifyListeners();
    }
  }

  void setSelectedGameType(GameTypeModel gameType){
    _selectedGameType = gameType;
    notifyListeners();
  }

  void setSelectedGame(GameModel gameModel){
    _selectedGame = gameModel;
    _guestMax = gameModel.guestMax ?? gameModel.gameType.guestMax;
    _guestMin = gameModel.guestMin ?? gameModel.gameType.guestMin;
    _guestCount = _guestMin;
    notifyListeners();
  }

  void setSelectedDate(DateEntity dateEntity){
    _selectedDate = dateEntity;
    notifyListeners();
  }

  void setSelectedTime(TimeEntity timeEntity){
    _selectedTime = timeEntity;
    notifyListeners();
  }



  void getTypes() async{
    _gameTypes = await RemoteService.getInstance().getGameTypes();
    _isLoadedGameType = true;
    notifyListeners();
  }

  void getDates() async{
    _isLoadedDate = false;
    _bookingDateModel = await RemoteService.getInstance().getDates(_selectedGame!.id);
    _isLoadedDate = true;
    notifyListeners();
  }

}