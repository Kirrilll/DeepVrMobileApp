import 'dart:async';

import 'package:deepvr/core/usecases/special_types/fetching_item.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/locator.dart';
import '../../../../core/usecases/mixins/fetch_mixin.dart';

class BookingGamesModel with ChangeNotifier, FetchMixin {
  final GamesService _gamesService = locator<GamesService>();

  Stream<List<Game>> gamesStreamByTypeId(int id) => _gamesService.gamesByTypeId(id);

  Stream<List<Game>> get gamesStream => _gamesService.games;

}
