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
}
