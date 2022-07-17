import 'package:deepvr/ui/widgets/calendar.dart';
import 'package:deepvr/data/entities/booking_calendar.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/base_booking_step_model.dart';
import 'package:deepvr/domain/models/date.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/usecases/mixins/fetch_mixin.dart';
import 'package:deepvr/usecases/mixins/select_mixin.dart';
import 'package:flutter/cupertino.dart';

import '../models/month.dart';

class CalendarModel extends BaseBookingStepModel
    with ChangeNotifier, FetchMixin {
  BookingCalendar? _calendar;
  final BookingService _bookingService = locator<BookingService>();
  int _monthIndex = 0;

  @override
  bool isFinished() => bookingModel.booking.selectedDate != null;
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


  Future<void> getCalendar() async {
    setStatus(FetchingState.loading);
    final calendar = await _bookingService.getDates(
        bookingModel.booking.selectedGame!.id,
        bookingModel.booking.guestCount!);
    if (calendar == null) {
      setStatus(FetchingState.error);
    } else {
      _calendar = calendar;
      _monthIndex = 0;
      setStatus(FetchingState.successful);
    }
  }

  void selectDate(Date? date) {
    bookingModel.updateBooking(Booking.copyWith(Booking.initial(),
        selectedType: bookingModel.booking.selectedType!,
        selectedGame: bookingModel.booking.selectedGame,
        guestCount: bookingModel.booking.guestCount,
        selectedDate: date,
        phone: bookingModel.booking.phone,
        name: bookingModel.booking.name));
  }

}
