import 'package:deepvr/data/entities/game.dart';
import 'package:http/http.dart' as http;

class GamesService{
  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/';
  
  Future<List<Game>?> getAllGames() async{
    var url = Uri.parse(_apiUrl + 'games');
    final response = await _client.get(url);
    if(response.statusCode == 200){
      return Game.gamesFromJson(response.body);
    }
    return null;
  }
}