class Bonus{
  String title;
  int count;
  DateTime? expiredDate;

  Bonus({required this.count, required this.title, this.expiredDate});

  String get expiredDateStr => expiredDate !=null
      ? expiredDate.toString().substring(0, 11)
      : '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bonus &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          count == other.count;

  @override
  int get hashCode => title.hashCode ^ count.hashCode;
}