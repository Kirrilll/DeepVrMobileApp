
import 'package:deepvr/domain/models/time.dart';

class Date{
  final DateTime date;
  final List<Time> availableTime;

  Date({
    required this.date,
    required this.availableTime
  });


  factory Date.copyFrom(Date dateEntity){
    return Date(date: dateEntity.date, availableTime: List.of(dateEntity.availableTime));
  }

  factory Date.fromMap(MapEntry<String, Map<String, List<int>>> map){
    return Date(date: DateTime.parse(map.key), availableTime: Time.listFromMap(map.value));
  }

  @override
  String toString() {
    return date.toString().substring(0, 10);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Date &&
          runtimeType == other.runtimeType &&
          date == other.date;

  @override
  int get hashCode => date.hashCode;
}