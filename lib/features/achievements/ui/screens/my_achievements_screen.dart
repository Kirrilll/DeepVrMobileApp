import 'package:deepvr/features/achievements/domain/view_models/achievement_model.dart';
import 'package:deepvr/features/achievements/ui/widgets/achievement_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAchievementsScreen extends StatelessWidget {
  const MyAchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<AchievementModel>(
      builder: (_, model, __) => ListView.separated(
                itemCount: model.userAchievements.length,
                itemBuilder: (_, index) =>
                    AchievementCard(achievement: model.userAchievements[index]),
                separatorBuilder: (_, index) => const SizedBox(height: 16),
              ),
    );
  }
}
