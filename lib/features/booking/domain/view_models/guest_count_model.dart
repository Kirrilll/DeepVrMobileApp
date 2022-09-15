import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/features/booking/domain/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/locator.dart';
import '../services/booking_service.dart';

class GuestModel with ChangeNotifier implements IBookingModel {

  final BookingService _bookingService = locator<BookingService>();
  int _guestCount = 0;
  int _guestMax = 0;
  int _guestMin = 0;

  bool get isMax => _guestCount == _guestMax;
  bool get isMin => _guestCount == _guestMin;
  int get guestCount => _guestCount;

  GuestModel(){
    _bookingService.addListener(() {
      if(_bookingService.lastChangeItemName is BookingGamesModel){
        _guestMin = _bookingService.booking.selectedGame?.guestMin ?? _bookingService.booking.selectedType!.guestMin;
        _guestMax = _bookingService.booking.selectedGame?.guestMax ?? _bookingService.booking.selectedType!.guestMax;
        _guestCount = _guestMin;
        notifyListeners();
      }
    });
  }

  void increment(){
    setCount(_guestCount+1);
  }

  void decrement(){
    setCount(_guestCount-1);
  }

  void setCount(int count){
    if(count >= _guestMin && count <= _guestMax){
      _guestCount = count;
      notifyListeners();
    }
  }

  @override
  bool isFinished() => true;

  @override
  void onNext() {
    _bookingService.updateBooking(Booking.copyWith(_bookingService.booking, guestCount: _guestCount), this);
  }

  @override
  Future<void> onNextAsync() async {}

}