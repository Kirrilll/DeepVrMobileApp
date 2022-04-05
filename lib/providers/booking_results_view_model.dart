import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

//Может это оберткой над всеМ
class BookingResultsViewModel with ChangeNotifier implements IBookingViewModel{
  PageState _pageState = PageState.loaded;

  GameTypeModel? _selectedType ;
  GameModel? _selectedGame;
  int? _guestCount;
  DateEntity? _selectedDate;
  TimeEntity? _selectedTime;


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
    final gameTypeViewModel = locator<GameTypeViewModel>();
    final gamesViewModel = locator<GamesViewModel>();
    final counterViewModel = locator<CounterViewModel>();
    final dateViewModel = locator<DateViewModel>();
    final timeViewModel = locator<TimeViewModel>();

    // _selectedType = gameTypeViewModel.selectedType!;
    // _selectedGame = gamesViewModel.selectedGame!;
    // _guestCount = counterViewModel.guestCount;
    // _selectedDate = dateViewModel.selectedDate!;
    // _selectedTime = timeViewModel.selectedTime!;
    // if(gameTypeViewModel.isFinished()) {
    //   _selectedType = gameTypeViewModel.selectedType!;
    // }

    gameTypeViewModel.addListener(() {
      if(gameTypeViewModel.isFinished()) {
        _selectedType = gameTypeViewModel.selectedType!;
      }
      notifyListeners();
    });

    gamesViewModel.addListener(() {
      if(gamesViewModel.isFinished()){
        _selectedGame = gamesViewModel.selectedGame!;
      }
      notifyListeners();
    });

    counterViewModel.addListener(() {
      _guestCount = counterViewModel.guestCount;
      notifyListeners();
    });

    dateViewModel.addListener(() {
      if(dateViewModel.isFinished()){
        _selectedDate = dateViewModel.selectedDate!;
        notifyListeners();
      }
    });

    timeViewModel.addListener(() {
      if(timeViewModel.isFinished()){
        _selectedTime = timeViewModel.selectedTime!;
        notifyListeners();
      }
    });
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