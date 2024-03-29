import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:http/http.dart' as http;


class GamesRepository{
  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/';

  Future<List<Game>> getAllGames() async{
    var url = Uri.parse(_apiUrl + 'games');
    final response = await _client.get(url);
    print('fetch');
    if(response.statusCode == 200){
      return Game.gamesFromJson(response.body);
    }
    else {
      throw Exception('Ошибка подключения');
    }
  }
}