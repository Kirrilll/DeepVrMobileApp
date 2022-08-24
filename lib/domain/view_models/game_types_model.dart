import 'package:deepvr/features/booking/data/entities/game_type.dart';
import 'package:deepvr/features/booking/data/repositories/booking_repository.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/view_models/base_booking_step_model.dart';
import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/core/usecases/mixins/fetch_mixin.dart';
import 'package:flutter/cupertino.dart';

class GameTypeModel extends BaseBookingStepModel with ChangeNotifier, FetchMixin{
  final BookingRepository _bookingService = locator<BookingRepository>();
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