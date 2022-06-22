import 'package:deepvr/data/services/games_service.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class GamesProvider with ChangeNotifier{
  var _isLoaded = false;
  List<GameModel>? _games;

  bool get isLoaded => _isLoaded;
  List<GameModel>? get games => _games;


  GamesProvider(){
    // locator<GamesService>().getAllGames();
    // locator<GamesService>().getGameDescription(17);
  }

  void getGames() async{
    locator<RemoteService>().getGames().then((res){
      _games = res;
      _isLoaded = true;
      notifyListeners();
    });
  }
}