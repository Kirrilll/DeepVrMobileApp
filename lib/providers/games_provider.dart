import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';

class GamesProvider with ChangeNotifier{
  var _isLoaded = false;
  List<GameModel>? _games;

  bool get isLoaded => _isLoaded;
  List<GameModel>? get games => _games;

  void getGames() async{
    RemoteService.getInstance().getGames().then((res){
      _games = res;
      _isLoaded = true;
      notifyListeners();
    });
  }
}