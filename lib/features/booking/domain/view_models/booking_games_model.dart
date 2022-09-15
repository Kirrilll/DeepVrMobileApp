import 'dart:async';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/features/booking/domain/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/services/booking_service.dart';
import 'package:deepvr/features/booking/domain/view_models/game_type_model.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:flutter/material.dart';
import '../../../../core/domain/locator.dart';
import '../../../../core/usecases/mixins/fetch_mixin.dart';

class BookingGamesModel with ChangeNotifier, FetchMixin implements IBookingModel {
  final GamesService _gamesService = locator<GamesService>();
  final BookingService _bookingService = locator<BookingService>();

  Stream<List<Game>> get games => _gamesService.gamesByTypeId(_bookingService.booking.selectedType?.id);
  Game? get selectedGame => _bookingService.booking.selectedGame;

  BookingGamesModel(){
    _bookingService.addListener(() {
      if(_bookingService.lastChangeItemName is GameTypeModel){
        selectGame(null);
      }
    });
  }

  @override
  bool isFinished() => selectedGame != null;

  void selectGame(Game? game){
    _bookingService.updateBooking(_bookingService.booking..selectedGame = game, this);
    notifyListeners();
  }

  @override
  void onNext() {}

  @override
  Future<void> onNextAsync() async {}

}
