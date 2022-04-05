
import 'package:deepvr/entities/time_entity.dart';

class DateEntity{
  late DateTime date;
  late List<TimeEntity> availableTime;

  DateEntity({
    required this.date,
    required this.availableTime
  });


  DateEntity.copyFrom(DateEntity dateEntity){
    date = dateEntity.date;
    availableTime = List.of(dateEntity.availableTime);
  }

  factory DateEntity.fromMap(MapEntry<String, Map<String, List<int>>> map){
    return DateEntity(date: DateTime.parse(map.key), availableTime: TimeEntity.entitiesFromMap(map.value));
  }



  @override
  String toString() {
    return '$date ${availableTime.length}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateEntity &&
          runtimeType == other.runtimeType &&
          date == other.date;

  @override
  int get hashCode => date.hashCode;
}