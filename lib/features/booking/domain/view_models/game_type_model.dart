import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/core/usecases/mixins/fetch_mixin.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/booking/data/entities/game_type.dart';
import 'package:deepvr/features/booking/data/repositories/booking_repository.dart';
import 'package:deepvr/features/booking/usecases/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/services/booking_service.dart';
import 'package:deepvr/features/booking/usecases/updating_keys.dart';
import 'package:flutter/material.dart';

class GameTypeModel with ChangeNotifier, FetchMixin implements IBookingModel{
  final BookingService _bookingService = locator<BookingService>();
  final BookingRepository _bookingRepository = locator<BookingRepository>();
  List<GameType> _gameTypes = List.empty();

  GameTypeModel(){
    loadTypes();
    _bookingService.addListener(() {
      if(_bookingService.updatingKey == cascadeUpdateKey){
        notifyListeners();
      }
    });
  }

  GameType? get selectedType => _bookingService.booking.selectedType;
  List<GameType> get gameTypes => _gameTypes;

  void setGameType(GameType? gameType){
    _bookingService.updateBooking(_bookingService.booking..selectedType = gameType, getUpdatingKey());
    notifyListeners();
  }

  Future<void> loadTypes()async {
    setStatus(FetchingState.loading);
    final res =  await _bookingRepository.getGameTypes();
    if(res == null){
      setStatus(FetchingState.error);
    }
    else{
      _gameTypes = res;
      setStatus(FetchingState.successful);
    }
  }

  @override
  bool isFinished() => selectedType != null;

  @override
  void onNext() {
    return;
  }

  @override
  Future<void> onNextAsync() async {
    return;
  }

  @override
  String getUpdatingKey() => gameTypesKey;



}