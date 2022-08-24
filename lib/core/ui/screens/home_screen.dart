import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/usecases/utils/scale_util.dart';
import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import '../widgets/tab_nav_bar.dart';
import '../widgets/tab_nav_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScaleUtil scaleUtil = locator<ScaleUtil>();
    scaleUtil.init(MediaQuery.of(context).size);

    return SafeArea(
      // child: MediaQuery(
      //   data: MediaQueryData(
      //     textScaleFactor: scaleUtil.getTextScaleFactor()
      //   ),
        child:AutoTabsScaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          routes: const [
            GamesRouter(),
            BookingRouter(),
            AchievementsRouter(),
            AccountRouter(),
          ],
          bottomNavigationBuilder: (_, router) => TabNavBar(
            tabBarItems: [
              TabNavButton(
                  navToNamed: () => router.navigateNamed('games'),
                  iconPath: 'assets/icons/nav_games_icon.png',
                  label: 'Игры',
                  isActive: router.activeIndex == 0
              ),
              TabNavButton(
                  navToNamed: () => router.navigateNamed('booking'),
                  iconPath: 'assets/icons/nav_booking_icon.png',
                  label: 'Бронирование',
                  isActive: router.activeIndex == 1
              ),
              TabNavButton(
                  navToNamed: () => router.navigateNamed('achievements'),
                  iconPath: 'assets/icons/nav_achievement_icon.png',
                  label: 'Достижения',
                  isActive: router.activeIndex == 2
              ),
              TabNavButton(
                  navToNamed: () => router.navigateNamed('account'),
                  iconPath: 'assets/icons/nav_profile_icon.png',
                  label: 'Аккаунт',
                  isActive: router.activeIndex == 3
              ),
            ],
          ),
       // ),
     ),
    );
  }
}
