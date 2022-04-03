import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/models/booking_date_model/booking_date_model.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'game_type_view_model.dart';

class DateViewModel with ChangeNotifier implements BaseBookingViewModel{

  DateEntity? _selectedDate;
  BookingDateModel? _calendar;
  PageState _pageState = PageState.unLoaded;
  final _gamesViewModel = locator<GamesViewModel>();

  //На момент запроса все элементы проинициалированные
  PageState get pageState => _pageState;
  BookingDateModel get calendar => _calendar!;
  DateEntity? get selectedDate => _selectedDate;

  //Обновление GamesViewModel происходит только при обновлении выбранной игры
  //Init происходит за страницу (Counter)
  //Поэтому повторная инициализация
  DateViewModel(){
    _update();
    _gamesViewModel.addListener(()  {
      _update();
    });
  }

  void _update() async{
    if(_gamesViewModel.isFinished()){
      _calendar = await RemoteService.getInstance().getDates(_gamesViewModel.selectedGame!.id);
      _pageState = PageState.loaded;
    }
    else{
      _calendar = null;
      _pageState = PageState.unLoaded;
    }
    _selectedDate = null;
    notifyListeners();
  }

  void selectDate(DateEntity date){
    _selectedDate = date;
    notifyListeners();
  }


  @override
  BaseBookingViewModel? getNext() {
    // TODO: implement getNext
    throw UnimplementedError();
  }

  @override
  BaseBookingViewModel? getPrev() {
    return locator<CounterViewModel>();
  }

  @override
  bool isFinished() {
    if(_selectedDate == null) return false;
    return true;
  }

}