import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/models/order.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

enum RequestInfo {
  notSend,
  loading,
  successful,
  error
}

//Может это оберткой над всеМ
class BookingResultsViewModel with ChangeNotifier implements IBookingViewModel{

  final _gameTypeModel = locator<GameTypeViewModel>();
  final _gamesModel = locator<GamesViewModel>();
  final _counterModel = locator<CounterViewModel>();
  final _dateModel = locator<DateViewModel>();
  final _timeModel = locator<TimeViewModel>();
  final _formModel = locator<BookingFormViewModel>();

  GameTypeModel? _selectedType ;
  GameModel? _selectedGame;
  int? _guestCount;
  DateEntity? _selectedDate;
  TimeEntity? _selectedTime;
  RequestInfo _requestStatus = RequestInfo.notSend;


  int get price => _guestCount! * _selectedGame!.price;
  String get game => _selectedGame!.title;
  String get type => _selectedType!.title;
  String get date => _selectedDate!.date.toString().replaceRange(10, _selectedDate!.date.toString().length, '');
  String get time => _selectedTime!.time;
  int get guestCount => _guestCount!;

  bool isAvailable(){
    return _selectedType != null &&
            _selectedGame != null &&
            _selectedDate != null &&
            _selectedType != null;
  }

  BookingResultsViewModel(){

    _gameTypeModel.addListener(() {
      if(_gameTypeModel.isFinished()) {
        _selectedType = _gameTypeModel.selectedType!;
      }
      notifyListeners();
    });

    _gamesModel.addListener(() {
      if(_gamesModel.isFinished()){
        _selectedGame = _gamesModel.selectedGame!;
      }
      notifyListeners();
    });

    _counterModel.addListener(() {
      _guestCount = _counterModel.guestCount;
      notifyListeners();
    });

    _dateModel.addListener(() {
      if(_dateModel.isFinished()){
        _selectedDate = _dateModel.selectedDate!;
        notifyListeners();
      }
    });

    _timeModel.addListener(() {
      if(_timeModel.isFinished()){
        _selectedTime = _timeModel.selectedTime!;
        notifyListeners();
      }
    });
  }

  void order() async{
    _requestStatus = RequestInfo.loading;
    RemoteService.getInstance().postData(Order(
        userName: _formModel.name,
        userPhone: _formModel.phoneNumber,
        guestDate: date,
        guestTime: _selectedTime!.time
    ), _selectedGame!.id).then(
        (res) => print(res)
    );

  }

  @override
  IBookingViewModel? getNext() {
    return null;
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<BookingFormViewModel>();
  }

  @override
  bool isFinished() {
    // TODO: implement isFinished
    throw UnimplementedError();
  }

  @override
  int getPageNumber() {
    return 6;
  }

}