import 'dart:convert';
import 'package:deepvr/models/game_model/room_model.dart';

import '../game_type_model.dart';

class GameModel {
  int id;
  String title;
  int timeDuration;
  int price;
  int gameTypeId;
  String? slug;
  int? isActive;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? logo;
  int? guestMin;
  int? guestMax;
  //List<Room> rooms;
  GameTypeModel gameType;

  GameModel({
    required this.id,
    required this.title,
    this.slug,
    required this.timeDuration,
    required this.price,
    required this.gameTypeId,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.logo,
    this.guestMin,
    this.guestMax,
    //required this.rooms,
    required this.gameType
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    id: json['id'],
    title: json['title'],
    slug: json['slug'],
    timeDuration: json['time_duration'],
    price: json['price'],
    gameTypeId: json['game_type_id'],
    isActive: json['is_active'],
    deletedAt: json['deleted_at'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    logo: json['logo'],
    guestMin: json['guest_min'],
    guestMax: json['guest_max'],
    //rooms: Room.roomsFromJson(json['rooms']),
    gameType: GameTypeModel.fromJson(json['game_type'])
);

  static List<GameModel> gamesFromJson(String str) {
    return List<GameModel>.from(json.decode(str).map((x) => GameModel.fromJson(x)));
  }
}