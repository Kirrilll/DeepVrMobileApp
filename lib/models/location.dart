import 'dart:convert';

class Location{
  String _town;
  String _country;
  String _api;


  String get town => _town;
  String get country => _country;
  String get api => _api;


  Location(this._town, this._country, this._api);

   factory Location.fromJson(Map<String, dynamic> json) => Location(
       json['town'], json['country'], json['api']
   );

   factory Location.decodeJson(String jsonStr) {
     var decode = json.decode(jsonStr);
     return Location.fromJson(decode);
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['town'] = _town;
    data['country'] = _country;
    data['api'] = _api;
    return data;
  }

  String encodeJson(){
    return json.encode(this);
  }

  @override
  String toString() {
    return 'Location{_town: $_town, _country: $_country, _api: $_api}';
  }
}