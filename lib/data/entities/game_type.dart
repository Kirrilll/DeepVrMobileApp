class GameType {
  int? id;
  String? title;
  int? needAllRoom;
  int? timeDuration;
  int? guestMin;
  int? guestMax;
  String? slug;
  String? image;

  GameType(
      {this.id,
        this.title,
        this.needAllRoom,
        this.timeDuration,
        this.guestMin,
        this.guestMax,
        this.slug,
        this.image});

  GameType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    needAllRoom = json['need_all_room'];
    timeDuration = json['time_duration'];
    guestMin = json['guest_min'];
    guestMax = json['guest_max'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['need_all_room'] = needAllRoom;
    data['time_duration'] = timeDuration;
    data['guest_min'] = guestMin;
    data['guest_max'] = guestMax;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}