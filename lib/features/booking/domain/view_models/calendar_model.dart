import 'package:deepvr/core/usecases/mixins/fetch_mixin.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/models/date.dart';
import 'package:deepvr/domain/models/month.dart';
import 'package:deepvr/features/booking/data/entities/booking_calendar.dart';
import 'package:deepvr/features/booking/data/repositories/booking_repository.dart';
import 'package:deepvr/features/booking/domain/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:deepvr/features/booking/domain/view_models/guest_count_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/locator.dart';
import '../services/booking_service.dart';

//Модель хранит данные от которых она зависит
//id игры и кол-во людей?
//Возвращать из сервиса параметр который изменен?
class CalendarModel with ChangeNotifier, FetchMixin  implements IBookingModel{
  final BookingService _bookingService = locator<BookingService>();
  final _bookingRepository = locator<BookingRepository>();
  BookingCalendar? _calendar;
  int _monthIndex = 0;

  bool get mayNext => _monthIndex < months.length - 1;
  bool get mayBack => _monthIndex > 0;
  List<Month> get months => _calendar != null
      ? Month.monthsFromMap(_calendar!.schedule)
      : List.empty();
  Date? get selectedDate => _bookingService.booking.selectedDate;
  int get monthIndex => _monthIndex;

  CalendarModel(){
    loadCalendar();
    _bookingService.addListener(() {
      if(_bookingService.lastChangeItemName is BookingGamesModel
      || _bookingService.lastChangeItemName is GuestModel){
        loadCalendar();
        setDate(null);
      }
    });
  }

  void setMonthIndex(int index){
    if(index <= months.length-1 && index >=0){
      _monthIndex = index;
      notifyListeners();
    }
  }

  void setDate(Date? date){
    _bookingService.updateBooking(_bookingService.booking..selectedDate = date, this);
    notifyListeners();
  }

  Future<void> loadCalendar() async{
    setStatus(FetchingState.loading);
    if(_bookingService.booking.guestCount == null || _bookingService.booking.selectedGame == null){
      return;
    }
    final res = await _bookingRepository.getDates(
        _bookingService.booking.selectedGame!.id,
        _bookingService.booking.guestCount!
    );
    if(res!= null){
      _calendar = res;
      setStatus(FetchingState.successful);
    }
    else{
      setStatus(FetchingState.error);
    }
  }

  @override
  bool isFinished() => selectedDate != null;

  @override
  void onNext() {}

  @override
  Future<void> onNextAsync() async {}
}