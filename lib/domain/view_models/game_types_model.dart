import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/base_booking_step_model.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/usecases/mixins/fetch_mixin.dart';
import 'package:flutter/cupertino.dart';

import '../models/booking.dart';

class GameTypeModel extends BaseBookingStepModel with ChangeNotifier, FetchMixin{
  final BookingService _bookingService = locator<BookingService>();
  List<GameType>? _gameTypes;

  List<GameType> get gameTypes => _gameTypes ?? List.empty();



  Future<void> getGameTypes() async{
    setStatus(FetchingState.loading);
    final response = await _bookingService.getGameTypes();
    if(response == null){
      setStatus(FetchingState.error);
    }
    else{
      _gameTypes = response;
      setStatus(FetchingState.successful);
    }
  }
}