import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/models/order.dart';
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
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

  RequestInfo _status = RequestInfo.notSend;

  RequestInfo get status => _status;

  void setStatus(RequestInfo status){
    _status = status;
    notifyListeners();
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
  bool isFinished(Booking booking) {
    if(status == RequestInfo.notSend) return true;
    return false;
  }

  @override
  int getPageNumber() {
    return 6;
  }


  void order() async{
    var bookingModel = locator<BookingModel>();
    var booking = bookingModel.booking;
    setStatus(RequestInfo.loading);
    var request =  await locator<RemoteService>().postData(Order(
        userName: booking.name,
        userPhone: booking.phone,
        guestDate: booking.selectedDate!.date.toString().replaceRange(10, booking.selectedDate!.date.toString().length, ''),
        guestTime: booking.selectedTime!.time,
        guestCount: booking.guestCount
    ), booking.selectedGame!.id);
    if(request!.error == 0){
    setStatus(RequestInfo.successful);
    }
  }

  @override
  Future<void> additionalFunc() async {
    //post на сервер
    var bookingModel = locator<BookingModel>();
    var booking = bookingModel.booking;
    setStatus(RequestInfo.loading);
    var request =  await locator<RemoteService>().postData(Order(
        userName: booking.name,
        userPhone: booking.phone,
        guestDate: booking.selectedDate!.date.toString().replaceRange(10, booking.selectedDate!.date.toString().length, ''),
        guestTime: booking.selectedTime!.time,
        guestCount: booking.guestCount
    ), booking.selectedGame!.id);
    if(request!.error == 0){
      setStatus(RequestInfo.successful);
    }
    bookingModel.init();
  }

  @override
  bool isMayBack() {
    if(_status == RequestInfo.notSend) return true;
    return false;
  }

}