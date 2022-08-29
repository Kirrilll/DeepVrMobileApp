import 'package:deepvr/core/usecases/special_types/tab.dart';
import '../../routing/router/app_router.gr.dart';

class TabsConfiguration{
  static final tabs = [
    const Tab(
        label: 'Игры',
        iconPath: 'assets/icons/nav_games_icon.png',
        route: GamesRouter()
    ),
    const Tab(
        label: 'Бронирование',
        iconPath: 'assets/icons/nav_booking_icon.png',
        route: BookingRouter()
    ),
    const Tab(
        label: 'Достижения',
        iconPath: 'assets/icons/nav_achievement_icon.png',
        route: AchievementsRouter()
    ),
    const Tab(
        label: 'Аккаунт',
        iconPath: 'assets/icons/nav_profile_icon.png',
        route: AccountRouter()
    ),
  ];
}