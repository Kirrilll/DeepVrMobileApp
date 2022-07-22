class Time{
  String time;
  List<int> idRooms;

  Time({
    required this.idRooms,
    required this.time
  });

  factory Time.fromMap(MapEntry<String, List<int>> map) => Time(time:map.key, idRooms: map.value);

  static List<Time> listFromMap(Map<String, List<int>> map){
    List<Time> timeEntities = List.empty(growable: true);
    map.forEach((key, value) {
      timeEntities.add(Time.fromMap(MapEntry(key, value)));
    });
    return  timeEntities;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Time &&
          runtimeType == other.runtimeType &&
          time == other.time &&
          idRooms == other.idRooms;

  @override
  int get hashCode => time.hashCode ^ idRooms.hashCode;
}