import 'package:http/http.dart' as http;

class GamesService{
  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/';
  
  Future<void> getAllGames() async{
    var url = Uri.parse(_apiUrl + 'games');
    final response = await _client.get(url);

  }
  
  Future<void> getGameDescription(int id) async{
    var url = Uri.parse(_apiUrl + 'game/$id');
    final response = await _client.get(url);
    print(response.body);
  }
}