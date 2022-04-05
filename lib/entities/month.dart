import 'package:deepvr/entities/calendarHelper.dart';
import 'package:deepvr/entities/date_entity.dart';

class Month {
  final int month;
  final int year;

  late List<DateEntity> _days;

  List<DateEntity> get days => List.of(_days);
  String get monthName{
    switch(month){
      case 1: {
        return "Январь";
      }
      case 2:{
        return "Февраль";
      }
      case 3: {
        return "Март";
      }
      case 4: {
        return "Апрель";
      }
      case 5: {
        return "Май";
      }
      case 6: {
        return "Июнь";
      }
      case 7: {
        return "Июль";
      }
      case 8: {
        return "Август";
      }
      case 9: {
        return "Сентябрь";
      }
      case 10: {
        return "Октябрь";
      }
      case 11: {
        return "Ноябрь";
      }
      case 12: {
        return "Декабрь";
      }
      default: {
        throw Error();
      }
    }
  }

  Month(this.month, this.year){
    _days = _filledDays(CalendarHelper.getMonthDaysCount(month));
  }
  
  List<DateEntity> _filledDays(int count ){

    return List.generate(count, (day) => DateEntity(date: DateTime(year, month, day+1), availableTime: []));
  }

  //Как-то костыльно
  static List<Month> monthFromMap(Map<String, Map<String, List<int>>> map){
    List<Month> months = List.empty(growable: true);
    List<DateEntity> monthAvailableDays = List.empty(growable: true);
    int monthIndex = 0;
    map.forEach((key, value) {
      DateEntity date = DateEntity.fromMap(MapEntry(key, value));
      if(monthAvailableDays.isNotEmpty && monthAvailableDays.first.date.month != date.date.month ){
        int i = 0; //индекс по months[monthIndex]._days
        while(monthAvailableDays.isNotEmpty){
          if(monthAvailableDays.first == months[monthIndex]._days[i]){
            months[monthIndex]._days[i] = DateEntity.copyFrom(monthAvailableDays.first);
            monthAvailableDays.removeAt(0); //Удаляем первый элемент
          }
          i++;
        }
        monthIndex++;
      }

      if(monthAvailableDays.isEmpty){
        months.add(Month(date.date.month, date.date.year));
      }
      monthAvailableDays.add(date);
    });

    //Последняя итерация не проходит, поэтому это здесь
    int j = 0;
    while(monthAvailableDays.isNotEmpty){
      if(monthAvailableDays.first == months[monthIndex]._days[j]){
        months[monthIndex]._days[j] = DateEntity.copyFrom(monthAvailableDays.first);
        monthAvailableDays.removeAt(0); //Удаляем первый элемент
      }
      j++;
    }

    return months;
  }
}