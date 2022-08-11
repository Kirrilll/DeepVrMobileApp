import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/data/services/games_service.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/domain/models/event.dart';
import 'package:flutter/cupertino.dart';

import '../../data/entities/game.dart';
import '../../locator.dart';
import '../enums/fetching_state.dart';

class GamesState {
  FetchingState eventsFetchingStatus;
  FetchingState gamesFetchingStatus;
  List<Game>? games;
  List<Event>? events;

  GamesState.initial(
      {this.eventsFetchingStatus = FetchingState.idle,
      this.gamesFetchingStatus = FetchingState.idle});

  GamesState({
    required this.eventsFetchingStatus,
    required this.gamesFetchingStatus,
    this.games,
    this.events,
  });

  GamesState copyWith({
    FetchingState? eventsFetchingStatus,
    FetchingState? gamesFetchingStatus,
    List<Game>? games,
    List<Event>? events,
  }) {
    return GamesState(
      eventsFetchingStatus: eventsFetchingStatus ?? this.eventsFetchingStatus,
      gamesFetchingStatus: gamesFetchingStatus ?? this.gamesFetchingStatus,
      games: games ?? this.games,
      events: events ?? this.events,
    );
  }
}

class GamesModel with ChangeNotifier {
  List<Game>? _games;
  GamesState _state = GamesState.initial();

  bool get isLoaded => _state.gamesFetchingStatus == FetchingState.successful;
  List<Game>? get games => _state.games;
  List<Event>? get events => _state.events;
  FetchingState get eventsFetchingStatus => _state.eventsFetchingStatus;

  _updateState(GamesState gamesState) {
    _state = gamesState;
    notifyListeners();
  }

  Future<void> getEvents() async {
    _updateState(_state.copyWith(events: [
      Event(
          id: 0,
          isWatched: false,
          avatar: 'https://i.pinimg.com/236x/c3/bd/fa/c3bdfa68b3c6fd1ee1e297486eaf226b.jpg',
          title: 'День рождения',
          pages: [
            'https://wonder-day.com/wp-content/uploads/2022/03/wonder-day-phone-wallpaper-for-kids-61.jpg',
            'https://wonder-day.com/wp-content/uploads/2022/03/wonder-day-phone-wallpaper-for-kids-61.jpg'
          ])
    ], eventsFetchingStatus: FetchingState.successful));
  }

  List<Game> getGamesByType(GameType? type) => type != null
      ? _games?.where((game) => game.gameType.id == type.id).toList() ??
          List.empty()
      : _games ?? List.empty();

  Future<void> getGames() async {
    _updateState(_state.copyWith(gamesFetchingStatus: FetchingState.loading));
    final res = await locator<GamesService>().getAllGames();
    if (res != null) {
      _updateState(_state.copyWith(
          gamesFetchingStatus: FetchingState.successful, games: res));
    }
  }
}
