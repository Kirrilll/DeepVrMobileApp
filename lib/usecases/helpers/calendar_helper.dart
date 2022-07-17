import 'package:deepvr/domain/models/month.dart';

class CalendarHelper{

  static bool _isLeapYear(int year){
    if(year % 4 == 0){
      if(year % 100 == 0 && year % 400 == 0) return true;
      return false;
    }
    return false;
  }

  static int getMonthDaysCount(int num){
    switch(num){
      case 1: {
        return 31;
      }
      case 2:{
        return _isLeapYear(DateTime.now().year)
            ? 29
            : 28;
      }
      case 3: {
        return 31;
      }
      case 4: {
        return 30;
      }
      case 5: {
        return 31;
      }
      case 6: {
        return 30;
      }
      case 7: {
        return 31;
      }
      case 8: {
        return 31;
      }
      case 9: {
        return 30;
      }
      case 10: {
        return 31;
      }
      case 11: {
        return 30;
      }
      case 12: {
        return 31;
      }
      default: {
        throw Error();
      }
    }
  }

  static String getMonthNameByNumber(int number){
    switch(number){
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



}