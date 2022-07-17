import 'dart:convert';

class BookingCalendar {
  Map<String, Map<String, List<int>>> schedule;
  Map<int, Room> rooms;
  Map<String, String> datesUi;

  BookingCalendar(
      {required this.schedule, required this.rooms, required this.datesUi});

  factory BookingCalendar.fromJsonStr(String str) =>
      BookingCalendar.fromJson(json.decode(str));

  factory BookingCalendar.fromJson(Map<String, dynamic> json) {
    Map<String, Map<String, List<int>>> schedule = {};
    Map<int, Room> rooms = {};
    json['schedule'].forEach((key, value) {

      schedule.putIfAbsent(key, () {
        if(value.runtimeType == List){
          return <String, List<int>>{};
        }
        Map<String, List<int>> timeLines = {};
        value.forEach((innerKey, innerValue) {
          timeLines.putIfAbsent(innerKey, () {
            return List<int>.from(innerValue);
          });
        });
        return timeLines;
      });
    });

    json['rooms'].forEach((key, value) {
      rooms.putIfAbsent(int.parse(key), () => Room.fromJson(value));
    });

    return BookingCalendar(
        schedule: schedule,
        rooms: rooms,
        datesUi: Map<String, String>.from(json['dates_ui']));
  }
}

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
    return List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));
  }
}
