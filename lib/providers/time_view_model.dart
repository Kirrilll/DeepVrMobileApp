import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class TimeViewModel with ChangeNotifier implements BaseBookingViewModel{

  TimeEntity? _selectedTime;
  late List<TimeEntity>? _availableTime;
  bool _isAvailable = false;
  final _dateViewModel = locator<DateViewModel>();

  bool get isAvailable => _isAvailable;
  List<TimeEntity> get availableTime => _availableTime!;
  TimeEntity? get selectedTime => _selectedTime;


  //notify происходит в случае добавления date или повторного получения данных
  TimeViewModel(){
    _dateViewModel.addListener(() {
      //isFinished только в том случае, когда selectedDate != null
      if(_dateViewModel.isFinished()){
        _availableTime = _dateViewModel.selectedDate!.availableTime;
        _isAvailable = true;
      }
      else{
        _availableTime = null;
        _isAvailable = false;
      }
      _selectedTime = null;
      notifyListeners();
    });
  }

  void selectTime(TimeEntity time){
    _selectedTime = time;
    notifyListeners();
  }

  @override
  BaseBookingViewModel? getNext() {
    // TODO: implement getNext
    throw UnimplementedError();
  }

  @override
  BaseBookingViewModel? getPrev() {
    // TODO: implement getPrev
    throw UnimplementedError();
  }

  @override
  bool isFinished() {
    // TODO: implement isFinished
    if(_selectedTime == null) return false;
    return true;
  }

}