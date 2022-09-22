import 'dart:async';
import 'package:deepvr/features/booking/usecases/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/services/booking_service.dart';
import 'package:deepvr/features/booking/usecases/updating_keys.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/locator.dart';
import '../../../../core/usecases/mixins/fetch_mixin.dart';

class BookingGamesModel with ChangeNotifier, FetchMixin implements IBookingModel {
  final GamesService _gamesService = locator<GamesService>();
  final BookingService _bookingService = locator<BookingService>();

  Stream<List<Game>> get games => _gamesService.gamesByTypeId(_bookingService.booking.selectedType?.id);
  Game? get selectedGame => _bookingService.booking.selectedGame;

  BookingGamesModel(){
    _bookingService.addListener(() {
      switch(_bookingService.updatingKey){
        case gameTypesKey:
          selectGame(null);
          break;
        case cascadeUpdateKey:
          notifyListeners();
          break;
      }
    });
  }

  @override
  bool isFinished() => selectedGame != null;

  void selectGame(Game? game){
    _bookingService.updateBooking(_bookingService.booking..selectedGame = game, getUpdatingKey());
    notifyListeners();
  }

  @override
  void onNext() {}

  @override
  Future<void> onNextAsync() async {}

  @override
  String getUpdatingKey() => gamesKey;

}
