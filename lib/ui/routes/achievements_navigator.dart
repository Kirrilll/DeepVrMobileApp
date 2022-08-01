import 'package:flutter/material.dart';

class AchievementsNavigator extends StatelessWidget {
  const AchievementsNavigator({Key? key}) : super(key: key);

  static const String _myAchievements = 'my_achievements';
  static const String _allAchievements = 'all_achievements';
  
  Route createRoute(Widget screen) => PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero
  );

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AchievementsNavigator._allAchievements,
      onGenerateRoute: (settings){
        switch(settings.name){
          case AchievementsNavigator._allAchievements:
            return createRoute(const Center(child: Text('в разработке')));
          case AchievementsNavigator._myAchievements:
            return createRoute(const Center(child: Text('мои')));
          default:
            return createRoute(const Center(child: Text('ошибка')));
        }
      },
    );
  }
}
