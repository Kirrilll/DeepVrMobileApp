class TimeEntity{
  String time;
  List<int> idRooms;

  TimeEntity({
    required this.idRooms,
    required this.time
  });

  factory TimeEntity.fromMap(MapEntry<String, List<int>> map) => TimeEntity(time:map.key, idRooms: map.value);

  static List<TimeEntity> entitiesFromMap(Map<String, List<int>> map){
    List<TimeEntity> timeEntities = List.empty(growable: true);
    map.forEach((key, value) {
      timeEntities.add(TimeEntity.fromMap(MapEntry(key, value)));
    });
    return  timeEntities;
  }
}