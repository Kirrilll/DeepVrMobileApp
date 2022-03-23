import 'dart:convert';

class Room {
  String title;
  int guestMax;

  Room({
    required this.title,
    required this.guestMax
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room (
    title:json['title'],
    guestMax:json['guest_max']
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['guest_max'] = guestMax;
    return data;
  }

  static List<Room> roomsFromJson(String str){
    //print('sfsf');
    return List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));
  }
}