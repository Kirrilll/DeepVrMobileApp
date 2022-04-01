

import 'package:deepvr/entities/date_entity.dart';

class MonthEntity{
  List<DateEntity> days;

  int get monthIndex => days.first.date.month;

  MonthEntity({
    required this.days,
  });


  static List<MonthEntity> monthsFromMap( Map<String, Map<String, List<int>>> map){

    List<MonthEntity> months = List.empty(growable: true);
    List<DateEntity> tempMonth = List.empty(growable: true);
    map.forEach((key, value) {
      DateEntity date = DateEntity.fromMap(MapEntry(key, value));
      //Если не пусто и месяца не совпадают
      if(tempMonth.isNotEmpty && tempMonth.first.date.month != date.date.month){
        months.add(MonthEntity(days: List.from(tempMonth)));
        tempMonth.clear();
      }
      tempMonth.add(date);
    });
    return months;
  }
}