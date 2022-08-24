import 'package:deepvr/features/profile/data/entities/client_purchase.dart';

class Purchase {
  int id;
  int guestCount;
  String game;
  String gameType;
  int price;
  DateTime date;

  Purchase(
      {required this.id,
      required this.guestCount,
      required this.game,
      required this.gameType,
      required this.price,
      required this.date});

  String getDate(){
    return '${(date.day < 10 ? '0': '') + date.day.toString()}.${(date.month < 10 ? '0': '') + date.day.toString()}.${date.year}';
  }
}
