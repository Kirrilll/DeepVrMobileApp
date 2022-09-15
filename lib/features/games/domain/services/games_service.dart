import 'dart:async';

import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/core/usecases/mixins/fetch_mixin.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/games/data/repositories/games_repository.dart';
import 'package:flutter/material.dart';
import '../../data/entities/game.dart';


class GamesService{
  final GamesRepository _gamesRepository = GamesRepository();
  late Future<List<Game>> _gamesFuture;
  bool isFetched = false;


  Stream<List<Game>> get games {
    if(!isFetched){
      _gamesFuture = _gamesRepository.getAllGames();
      isFetched = true;
    }
    return _gamesFuture.asStream();
  }

  Stream<List<Game>> gamesByTypeId(int? id){
    return id != null
        ? games
        .map((games) => games
              .where((game) => game.gameTypeId == id).toList())
        : games;
  }


}
