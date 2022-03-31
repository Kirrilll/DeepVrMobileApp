import 'dart:developer';

import 'package:deepvr/models/booking_date_model/room_model.dart';
import 'dart:convert';

class BookingDateModel {
  Map<String, Map<String, List<int>>> schedule;
  Map<int, Room> rooms;
  Map<String, String> datesUi;

  BookingDateModel(
      {required this.schedule, required this.rooms, required this.datesUi});

  factory BookingDateModel.fromJsonStr(String str) =>
      BookingDateModel.fromJson(json.decode(str));

  factory BookingDateModel.fromJson(Map<String, dynamic> json) {
    Map<String, Map<String, List<int>>> schedule = {};
    Map<int, Room> rooms = {};

    json['schedule'].forEach((key, value) {
      schedule.putIfAbsent(key, () {
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

    return BookingDateModel(
        schedule: schedule,
        rooms: rooms,
        datesUi: Map<String, String>.from(json['dates_ui']));
  }
}
