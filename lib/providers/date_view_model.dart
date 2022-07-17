import 'package:deepvr/domain/models/date.dart';
import 'package:deepvr/data/entities/booking_calendar.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'game_type_view_model.dart';

class DateViewModel with ChangeNotifier implements IBookingViewModel{



  BookingCalendar? _calendar;
  PageState _pageState = PageState.unLoaded;

  //На момент запроса все элементы проинициалированные
  PageState get pageState => _pageState;
  BookingCalendar get calendar => _calendar!;

  DateViewModel(){
    var bookingModel = locator<BookingModel>();
    bookingModel.addListener(() {
      if(bookingModel.booking.selectedGame != null &&  bookingModel.booking.guestCount != null) {
        getDates(bookingModel.booking.selectedGame!.id, bookingModel.booking.guestCount!);
      }
    });
  }

  void getDates(int gameId, int questCount) async{
    _calendar = await locator<BookingService>().getDates(gameId, questCount);
    _pageState = PageState.loaded;
  }

  @override
  IBookingViewModel? getNext() {
    return locator<TimeViewModel>();
  }

  @override
  IBookingViewModel? getPrev() {
    return locator<CounterViewModel>();
  }

  @override
  bool isFinished(Booking booking) {
    if(booking.selectedDate == null) return false;
    return true;
  }

  @override
  int getPageNumber() {
    return 3;
  }

  @override
   Future<void> additionalFunc() async {
    // TODO: implement additionalFunc
  }

  @override
  bool isMayBack() {
    return true;
  }

}