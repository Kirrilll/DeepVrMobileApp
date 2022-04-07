import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/time_helper.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class TimeViewModel with ChangeNotifier implements IBookingViewModel{

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

  bool isBooked(TimeEntity time){
    return !TimeHelper.isTimeAvailable(_dateViewModel.calendar.rooms, locator<CounterViewModel>().guestCount, time.idRooms);
  }

  void selectTime(TimeEntity time){
    _selectedTime = time;
    notifyListeners();
  }

  @override
  IBookingViewModel? getNext() {
    return locator<BookingFormViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<DateViewModel>();
  }

  @override
  bool isFinished() {
    if(_selectedTime == null) return false;
    return true;
  }

  @override
  int getPageNumber() {
    return 4;
  }

}