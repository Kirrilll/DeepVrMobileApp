import 'package:auto_route/auto_route.dart';
import 'package:deepvr/features/achievements/domain/view_models/achievement_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/domain/locator.dart';
import '../../../../core/usecases/special_types/fetching_state.dart';
import '../widgets/achievement_card.dart';

class AllAchievementsScreen extends StatelessWidget {
  const AllAchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AchievementModel>(
        builder: (_, model, __) => ListView.separated(
        itemCount: model.allAchievements.length,
        itemBuilder: (_, index) => AchievementCard(achievement: model.allAchievements[index]),
        separatorBuilder: (_, index) => const SizedBox(height: 16),
        )
    );
  }
}
