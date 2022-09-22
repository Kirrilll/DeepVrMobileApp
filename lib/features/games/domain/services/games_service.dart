import 'dart:async';

import 'package:deepvr/features/games/data/repositories/games_repository.dart';
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
