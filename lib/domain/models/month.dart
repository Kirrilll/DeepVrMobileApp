import 'package:deepvr/usecases/helpers/calendar_helper.dart';
import 'package:deepvr/domain/models/date.dart';

class Month {
  final int month;
  final int year;
  late List<Date> _days;

  List<Date> get days => List.of(_days);
  String get monthName => CalendarHelper.getMonthNameByNumber(month);

  Month(this.month, this.year){
    _days = _filledDays(CalendarHelper.getMonthDaysCount(month));
  }
  
  List<Date> _filledDays(int count ){
    return List.generate(count, (day) => Date(date: DateTime(year, month, day+1), availableTime: []));
  }

  //Как-то костыльно
  static List<Month> monthsFromMap(Map<String, Map<String, List<int>>> map){
    List<Month> months = List.empty(growable: true);
    List<Date> monthAvailableDays = List.empty(growable: true);
    int monthIndex = 0;
    map.forEach((key, value) {
      Date date = Date.fromMap(MapEntry(key, value));
      if(monthAvailableDays.isNotEmpty && monthAvailableDays.first.date.month != date.date.month ){
        int i = 0; //индекс по months[monthIndex]._days
        while(monthAvailableDays.isNotEmpty){
          if(monthAvailableDays.first == months[monthIndex]._days[i]){
            months[monthIndex]._days[i] = Date.copyFrom(monthAvailableDays.first);
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
        months[monthIndex]._days[j] = Date.copyFrom(monthAvailableDays.first);
        monthAvailableDays.removeAt(0); //Удаляем первый элемент
      }
      j++;
    }

    return months;
  }
}