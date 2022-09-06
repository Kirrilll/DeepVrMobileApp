import 'package:deepvr/features/achievements/data/entities/achievement.dart';
import 'package:deepvr/features/achievements/ui/widgets/achievement_card_image.dart';
import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    Key? key,
    required this.achievement
  }) : super(key: key);

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF191A29),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(67, 181, 224, 0.1),
            offset: Offset(0, 15),
            blurRadius: 40
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              achievement.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              //height: 21,
              fontWeight: FontWeight.w600
            ),
          ),
          AchievementCardImage(url: achievement.imgPath, isReceived: achievement.isReceived,)
        ],
      ),
    );
  }
}
