class Event {
  int id;
  List<String> pages;
  String avatar;
  bool isWatched;
  double duration;
  String title;

  Event({
    required this.id,
    required this.isWatched,
    required this.pages,
    required this.avatar,
    required this.title,
    this.duration = 2
  });
}