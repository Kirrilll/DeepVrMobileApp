import 'package:deepvr/data/entities/booking_calendar.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/usecases/mixins/fetch_mixin.dart';
import 'package:flutter/cupertino.dart';

import '../models/month.dart';

class CalendarModel with ChangeNotifier, FetchMixin {
  BookingCalendar? _calendar;
  final BookingService _bookingService = locator<BookingService>();
  int _monthIndex = 0;


  List<Month> get months => _calendar != null
      ? Month.monthsFromMap(_calendar!.schedule)
      : List.empty();
  int get selectedMonthIndex => _monthIndex;
  bool get mayNext => _monthIndex < months.length - 1;
  bool get mayBack => _monthIndex > 0;

  void setMonthIndex(int index){
    if(index <= months.length-1 && index >=0){
      _monthIndex = index;
      notifyListeners();
    }
  }


  Future<void> getCalendar(int selectedGameId, int guestCount) async {
    setStatus(FetchingState.loading);
    final calendar = await _bookingService.getDates(selectedGameId, guestCount);
    if (calendar == null) {
      setStatus(FetchingState.error);
    } else {
      _calendar = calendar;
      _monthIndex = 0;
      setStatus(FetchingState.successful);
    }
  }

}
