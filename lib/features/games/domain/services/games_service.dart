import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/features/fetching_item.dart';
import 'package:deepvr/features/games/data/repositories/games_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../data/entities/game.dart';

class _GamesState{
  FetchingState fetchingStatus = FetchingState.idle;
  List<Game>? games;

  _GamesState({
    required this.fetchingStatus,
    this.games,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _GamesState &&
          runtimeType == other.runtimeType &&
          fetchingStatus == other.fetchingStatus &&
          games == other.games);

  @override
  int get hashCode => fetchingStatus.hashCode ^ games.hashCode;


  _GamesState copyWith({
    FetchingState? fetchingStatus,
    List<Game>? games,
  }) {
    return _GamesState(
      fetchingStatus: fetchingStatus ?? this.fetchingStatus,
      games: games ?? this.games,
    );
  }

}

class GamesService with ChangeNotifier{
  _GamesState _liveData = _GamesState(fetchingStatus: FetchingState.idle);
  final GamesRepository _gamesRepository = GamesRepository();

  FetchingState get fetchingStatus => _liveData.fetchingStatus;
  List<Game> get games  => _liveData.games!;

  void _updateState(_GamesState data){
    _liveData = data;
    notifyListeners();
  }

  Future<void> fetchGames() async {
    if(_liveData.games != null) return;
    _updateState(_liveData.copyWith(fetchingStatus: FetchingState.loading));
    final result =  await _gamesRepository.getAllGames();
    if(result == null){
      _updateState(_liveData.copyWith(fetchingStatus: FetchingState.error));
    }
    else{
      _updateState(_liveData.copyWith(fetchingStatus: FetchingState.successful, games: result));
    }
  }

  List<Game> getByGameType(int gameTypeId) {
    return games
        .where((game) => game.gameType.id == gameTypeId)
        .toList();
  }
}