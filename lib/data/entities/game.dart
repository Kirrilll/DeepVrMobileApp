import 'dart:convert';

import 'package:deepvr/data/entities/game_type.dart';

class Game {
  int id;
  String title;
  String? slug;
  int? timeDuration;
  int price;
  int gameTypeId;
  int? isActive;
  DateTime? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? logo;
  int? guestMin;
  int? guestMax;
  String? description;
  int? ageLimit;
  List<String>? images;
  String? video;
  String? genre;
  GameType gameType;

  Game(
      {required this.id,
      required this.title,
      this.slug,
      this.timeDuration,
      required this.price,
      required this.gameTypeId,
      this.isActive,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      required this.logo,
      this.guestMin,
      this.guestMax,
      this.description,
      this.ageLimit,
      this.images,
      this.video,
      this.genre,
      required this.gameType});



  factory Game.fromJson(Map<String, dynamic> json)  => Game(
  id: json['id'],
  title: json['title'],
  price: json['price'],
  gameTypeId: json['game_type_id'],
  logo: json['logo'],
  gameType: GameType.fromJson(json['game_type']),
  slug: json['slug'],
  genre: json['genre'],
  images: json['images']  != null
      ? _decodeImages(json['images'])
      : List.empty(),
  timeDuration: json['time_duration'],
  deletedAt: json['deleted_at'],
  createdAt: json['created_at'],
  updatedAt: json['updated_at'],
  video: json['video'],
  ageLimit: json['age_limit'],
  guestMin: json['guest_min'],
  guestMax: json['guest_max'],
  description: json['description'],);

  static _decodeImages(String images) => List<String>.from(json.decode(images));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['time_duration'] = timeDuration;
    data['price'] = price;
    data['game_type_id'] = gameTypeId;
    data['is_active'] = isActive;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['logo'] = logo;
    data['guest_min'] = guestMin;
    data['guest_max'] = guestMax;
    data['description'] = description;
    data['age_limit'] = ageLimit;
    data['images'] = images;
    data['video'] = video;
    data['genre'] = genre;
    data['game_type'] = gameType.toJson();
    return data;
  }

  static List<Game> gamesFromJson(String data) {
   return List<Game>.from(json.decode(data).map((game) => Game.fromJson(game)));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Game && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}