import 'package:flutter/material.dart';

class AchievementCardImage extends StatelessWidget {
  const AchievementCardImage({
    Key? key,
    required this.isReceived,
    required this.url
  }) : super(key: key);

  final bool isReceived;
  final String url;

  @override
  Widget build(BuildContext context) {
    return  SizedBox.square(
      dimension: 64,
      child: Image.network(url),
    );
  }
}
