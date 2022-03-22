import 'package:deepvr/models/pivot.dart';
import 'dart:convert';

class Room {
  int? id;
  String? title;
  int? guestMax;
  Pivot? pivot;

  Room({this.id, this.title, this.guestMax, this.pivot});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    guestMax = json['guest_max'];
    pivot = Pivot.fromJson(json['pivot']);
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

  static List<Room> roomsFromJson(String str) {
    return List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));
  }
}