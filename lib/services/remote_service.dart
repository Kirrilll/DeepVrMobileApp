import 'package:deepvr/models/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:http/http.dart' as http;

class RemoteService{

  static final RemoteService _instance = RemoteService._();

  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/';

  RemoteService._(){}

  factory RemoteService.getInstance  () => _instance;

  Future<List<GameTypeModel>?> getGameTypes() async {
    var uri = Uri.parse(_apiUrl + 'gameTypes');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return GameTypeModel.gameTypesFromJson(json);
    }
  }

  Future<List<GameModel>?> getGames() async{
    var uri = Uri.parse(_apiUrl + 'games');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return GameModel.gamesFromJson(json);
    }
    return null;
  }
}