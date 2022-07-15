import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/booking_date_model/booking_date_model.dart';
import 'package:deepvr/models/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'game_type_view_model.dart';

class DateViewModel with ChangeNotifier implements IBookingViewModel{



  BookingDateModel? _calendar;
  PageState _pageState = PageState.unLoaded;

  //На момент запроса все элементы проинициалированные
  PageState get pageState => _pageState;
  BookingDateModel get calendar => _calendar!;

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