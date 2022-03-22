import 'dart:convert';

class GameTypeModel {
  int id;
  String title;
  int guestMax;
  int guestMin;
  int timeDuration;
  int needAllRoom;
  String? image;
  String? slug;

  GameTypeModel(
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

  factory GameTypeModel.fromJson(Map<String, dynamic> json) => GameTypeModel(
    id :json['id'],
    title:json['title'],
    guestMax: json['guest_max'],
    guestMin: json['guest_min'],
    timeDuration: json['time_duration'],
    needAllRoom: json['need_all_room'],
    image: json['image'],
    slug: json['slug']
  );

  static List<GameTypeModel> gameTypesFromJson(String str) {
    return List<GameTypeModel>.from(json.decode(str).map((x) => GameTypeModel.fromJson(x)));
  }
}