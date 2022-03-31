
import 'package:deepvr/entities/time_entity.dart';

class DateEntity{
  DateTime date;
  List<TimeEntity> availableTime;

  DateEntity({
    required this.date,
    required this.availableTime
  });
  
  factory DateEntity.fromMap(MapEntry<String, Map<String, List<int>>> map){
    return DateEntity(date: DateTime.parse(map.key), availableTime: TimeEntity.entitiesFromMap(map.value));
  }

  @override
  String toString() {
    // TODO: implement toString
    return date.toString();
  }
}