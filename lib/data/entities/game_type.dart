import 'dart:convert';

class GameType {
  int id;
  String title;
  int guestMax;
  int guestMin;
  int timeDuration;
  int needAllRoom;
  String? image;
  String? slug;

  GameType(
      {
        required this.id,
        required this.title,
        required this.guestMax,
        required this.guestMin,
        required this.timeDuration,
        required this.needAllRoom,
        this.image,
        this.slug
      });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['guest_min'] = guestMin;
    data['guest_max'] = guestMax;
    data['time_duration'] = timeDuration;
    data['need_all_room'] = needAllRoom;
    data['image'] = image;
    data['slug'] = slug;
    return data;
  }

  factory GameType.fromJson(Map<String, dynamic> json) => GameType(
    id :json['id'],
    title:json['title'],
    guestMax: json['guest_max'],
    guestMin: json['guest_min'],
    timeDuration: json['time_duration'],
    needAllRoom: json['need_all_room'],
    image: json['image'],
    slug: json['slug']
  );

  static List<GameType> gameTypesFromJson(String str) {
    return List<GameType>.from(json.decode(str).map((x) => GameType.fromJson(x)));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameType && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}