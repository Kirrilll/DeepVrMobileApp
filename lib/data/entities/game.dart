import 'package:deepvr/data/entities/game_type.dart';

class Game {
  int? id;
  String? title;
  String? slug;
  int? timeDuration;
  int? price;
  int? gameTypeId;
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
  List<Rooms>? rooms;
  GameType? gameType;

  Game(
      {this.id,
        this.title,
        this.slug,
        this.timeDuration,
        this.price,
        this.gameTypeId,
        this.isActive,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.logo,
        this.guestMin,
        this.guestMax,
        this.description,
        this.ageLimit,
        this.images,
        this.video,
        this.genre,
        this.rooms,
        this.gameType});

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    timeDuration = json['time_duration'];
    price = json['price'];
    gameTypeId = json['game_type_id'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logo = json['logo'];
    guestMin = json['guest_min'];
    guestMax = json['guest_max'];
    description = json['description'];
    ageLimit = json['age_limit'];
    images = json['images'];
    video = json['video'];
    genre = json['genre'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
    gameType = json['game_type'] != null
        ? GameType.fromJson(json['game_type'])
        : null;
  }

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
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    if (gameType != null) {
      data['game_type'] = gameType!.toJson();
    }
    return data;
  }
}

class Rooms {
  int? id;
  String? title;
  int? guestMax;
  Pivot? pivot;

  Rooms({this.id, this.title, this.guestMax, this.pivot});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    guestMax = json['guest_max'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['guest_max'] = guestMax;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

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
