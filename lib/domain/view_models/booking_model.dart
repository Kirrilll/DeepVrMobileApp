import 'dart:async';

import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/booking_information.dart';
import 'package:deepvr/domain/models/booking_state.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/domain/models/booking_step.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/usecases/configurations/booking_step_config.dart';
import 'package:deepvr/usecases/helpers/booking_helper.dart';
import 'package:flutter/cupertino.dart';

import '../../data/entities/game.dart';
import '../../locator.dart';
import '../models/date.dart';
import '../models/time.dart';

class BookingModel with ChangeNotifier {
  final List<BookingStep> _steps = bookingSteps;
  BookingState _state = BookingState.initial();
  String? _errorMessage;
  final BookingHelper _bookingHelper = locator<BookingHelper>();
  final BookingService _bookingService = locator<BookingService>();
  List<BookingStep> get steps => _steps;
  bool get isBooked => _state.isBooked;
  int get stepIndex => _state.stepIndex;
  bool get mayNext => _steps[stepIndex].isFinished(_state.booking);
  bool get mayBack => stepIndex > 0;
  int get maxCount => _state.booking.selectedGame?.guestMax ?? _state.booking.selectedGame!.gameType.guestMax;
  int get minCount => _state.booking.selectedGame?.guestMin ?? _state.booking.selectedGame!.gameType.guestMin;
  GameType? get selectedType => _state.booking.selectedType;
  Game? get selectedGame => _state.booking.selectedGame;
  int? get guestCount => _state.booking.guestCount;
  Date? get selectedDate => _state.booking.selectedDate;
  Time? get selectedTime => _state.booking.selectedTime;
  bool get isAgree => _state.booking.isAgree ?? false;
  String get name => _state.booking.name ?? '';
  String get phone => _state.booking.phone ?? '';
  String get comment => _state.booking.comment ?? '';
  FetchingState get bookingStatus => _state.bookingStatus;
  String? get errorMessage => _errorMessage;
  bool get mayBook => _steps.last.isFinished(_state.booking);
  BookingInformation get bookingInformation => _state.bookingInformation ?? BookingInformation.fromBooking(_state.booking);

  set selectedType(GameType? type) => updateBooking(_bookingHelper.setGameType(type, _state.booking));
  set selectedGame(Game? game) => updateBooking(_bookingHelper.setGame(game, _state.booking));
  set selectedDate(Date? date) => updateBooking(_bookingHelper.setDate(date, _state.booking));
  set selectedTime(Time? time) => updateBooking(_bookingHelper.setTime(time, _state.booking));
  set guestCount(int? count) => updateBooking(_bookingHelper.setGuestCount(count, _state.booking));
  set isAgree(bool value) => updateBooking(_bookingHelper.setAgreed(value, _state.booking));
  set name(String? name) => updateBooking(_bookingHelper.setName(name, _state.booking));
  set phone(String? phone) => updateBooking(_bookingHelper.setPhone(phone, _state.booking));
  set comment(String? comment) => updateBooking(_bookingHelper.setComment(comment, _state.booking));

  void init(){
    Booking initialBooking = Booking.copyWith(
        _state.booking,
        phone: locator<AuthenticationModel>().user.phone,
        name: locator<AuthenticationModel>().user.login
    );

    int lastFinishedStepIndex = _steps.lastIndexWhere((step) => step.isFinished(_state.booking));

    if(_state.isBooked){
      _state =  BookingState.initial().copyWith(
          booking: Booking.copyWith(
              Booking.initial(),
              phone: initialBooking.phone,
              name: initialBooking.name
          )
      );
      return;
    }
    _setState(_state.copyWith(
        stepIndex: lastFinishedStepIndex == -1 ? 0: lastFinishedStepIndex,
        booking: initialBooking)
    );

  }

  void next() {
    if (_state.stepIndex == _steps.length - 1) {
      _setState(_state.copyWith(bookingStatus: FetchingState.loading));
      _bookingService.book({
        "guest_quantity": guestCount.toString(),
        "guest_date": selectedDate!.date.toString().substring(0, 10),
        "guest_time": selectedTime!.time,
        "user_phone": phone,
        "user_name": name,
      }, selectedGame!.id).then((res) {
        if (res!.error == 0) {
          _setState(_state.copyWith(
              isBooked: true, bookingStatus: FetchingState.successful));
        } else {
          _errorMessage = res.errorText;
          _setState(_state.copyWith(bookingStatus: FetchingState.error));
        }
      }).onError((error, stackTrace) {
        _errorMessage = '?????? ????????????????????';
        _setState(_state.copyWith(bookingStatus: FetchingState.error));
      });
    } else {
      _setStepIndex(_state.stepIndex + 1);
    }
  }
  void getBookingInfo(){
    _setState(_state.copyWith(bookingStatus: FetchingState.loading));
    Future.value(BookingInformation(
        guestDate: selectedDate!.date.toString().substring(0, 10),
        guestCount: guestCount!,
        gameTitle: selectedGame!.title,
        guestTime: selectedTime!.time,
        roomTitle: selectedType!.title,
        bookingPrice: selectedGame!.price * guestCount!
    )).then((res) => _setState(_state.copyWith(bookingStatus: FetchingState.successful, bookingInformation: res)));
  }

  void back() {
    _setStepIndex(_state.stepIndex - 1);
  }

  void _setState(BookingState bookingState) {
    _state = bookingState;
    notifyListeners();
  }

  void _setStepIndex(int index) {
    if (index <= _steps.length && index >= 0) {
      _setState(_state.copyWith(stepIndex: index));
    }
  }

  void updateBooking(Booking booking, {GameType? selectedType}) {
    _setState(_state.copyWith(booking: booking));
  }
}
