class Achievement{
  String imgPath;
  String title;
  bool isReceived;
  String description;
  String prize;

  Achievement({
    required this.imgPath,
    required this.title,
    required this.isReceived,
    required this.description,
    required this.prize,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achievement &&
          runtimeType == other.runtimeType &&
          imgPath == other.imgPath &&
          title == other.title &&
          isReceived == other.isReceived &&
          description == other.description &&
          prize == other.prize);

  @override
  int get hashCode =>
      imgPath.hashCode ^
      title.hashCode ^
      isReceived.hashCode ^
      description.hashCode ^
      prize.hashCode;

  @override
  String toString() {
    return 'Achievement{' +
        ' imgPath: $imgPath,' +
        ' title: $title,' +
        ' isReceived: $isReceived,' +
        ' description: $description,' +
        ' prize: $prize,' +
        '}';
  }

  Achievement copyWith({
    String? imgPath,
    String? title,
    bool? isReceived,
    String? description,
    String? prize,
  }) {
    return Achievement(
      imgPath: imgPath ?? this.imgPath,
      title: title ?? this.title,
      isReceived: isReceived ?? this.isReceived,
      description: description ?? this.description,
      prize: prize ?? this.prize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imgPath': imgPath,
      'title': title,
      'isReceived': isReceived,
      'description': description,
      'prize': prize,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      imgPath: map['imgPath'] as String,
      title: map['title'] as String,
      isReceived: map['isReceived'] as bool,
      description: map['description'] as String,
      prize: map['prize'] as String,
    );
  }

//</editor-fold>
}