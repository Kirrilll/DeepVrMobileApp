class Pivot {
  int? gameId;
  int? roomId;

  Pivot({this.gameId, this.roomId});

  Pivot.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    roomId = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_id'] = gameId;
    data['room_id'] = roomId;
    return data;
  }
}