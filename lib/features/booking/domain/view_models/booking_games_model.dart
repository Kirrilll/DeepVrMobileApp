import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/features/fetching_item.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../../locator.dart';

class BookingGamesModel with ChangeNotifier{
  FetchingState _fetchingStatus = FetchingState.idle;
  final GamesService _gamesService = locator<GamesService>();

  FetchingState get fetchingStatus => _fetchingStatus;

  BookingGamesModel(){
    _fetchingStatus = _gamesService.fetchingStatus;
    _gamesService.addListener(() {
      _updateState(_gamesService.fetchingStatus);
    });
  }

  _updateState(FetchingState status){
    _fetchingStatus = status;
    notifyListeners();
  }

   List<Game> getGamesByType(int? gameTypeId) {
    return gameTypeId != null
        ? _gamesService.getByGameType(gameTypeId)
        : _gamesService.games;
  }
 }