import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/routing/wrappers/account_router_wrapper.dart';
import 'package:deepvr/core/routing/guards/route_duplicate_guard.dart';
import 'package:deepvr/core/routing/wrappers/achievements_router_wrapper.dart';
import 'package:deepvr/features/achievements/ui/screens/unauth_achievements_screen.dart';
import 'package:deepvr/features/booking/ui/screens/successful_screen.dart';
import 'package:deepvr/features/profile/ui/screens/about_screen.dart';
import 'package:deepvr/features/achievements/ui/screens/all_achievements_screen.dart';
import 'package:deepvr/features/booking/ui/screens/booking_page.dart';
import 'package:deepvr/features/profile/ui/screens/feedback_screen.dart';
import 'package:deepvr/features/games/ui/screens/games_main.dart';
import 'package:deepvr/core/ui/screens/home_screen.dart';
import 'package:deepvr/core/routing/wrappers/home_wrapper_screen.dart';
import 'package:deepvr/features/achievements/ui/screens/my_achievements_screen.dart';
import 'package:deepvr/features/profile/ui/screens/profile_main.dart';
import 'package:deepvr/features/profile/ui/screens/profile_settings_main.dart';
import 'package:deepvr/features/profile/ui/screens/profile_statuses.dart';
import 'package:deepvr/features/profile/ui/screens/purchase_history.dart';
import 'package:deepvr/features/authentication/ui/screens/signin.dart';
import 'package:deepvr/features/authentication/ui/screens/signup.dart';
import 'package:deepvr/core/ui/screens/splash_screen.dart';
import 'package:deepvr/features/profile/ui/screens/update_screen.dart';

const _accountRoute = AutoRoute(
    initial: true,
    path: 'account',
    name: 'AccountRouter',
    page: AccountRouterWrapper,
    children: [
      AutoRoute(
          path: 'auth',
          name: 'AuthenticationRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: 'signin', page: SignInScreen, initial: true),
            AutoRoute(path: 'signup', page: SignUpScreen),
          ]),
      AutoRoute(
          path: 'profile',
          name: 'ProfileRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ProfileMain),
            AutoRoute(path: 'statuses', page: ProfileStatuses),
            AutoRoute(path: 'history', page: PurchaseHistory),
            AutoRoute(
                path: 'settings',
                guards: [RouteDuplicateGuard],
                name: 'SettingsRouter',
                page: EmptyRouterPage,
                children: [
                  AutoRoute(path: '', page: SettingsMain, initial: true),
                  AutoRoute(path: 'about', page: AboutScreen),
                  AutoRoute(path: 'feedback', page: FeedbackScreen),
                  AutoRoute(path: 'update', page: UpdateScreen),
                ])
          ])
    ]);

const _bookingRoute = AutoRoute(
    path: 'booking',
    name: 'BookingRouter',
    page: EmptyRouterPage,
    children: [
      AutoRoute(path: '', page: BookingPage),
      AutoRoute(path: 'successful', page: SuccessfulScreen)
    ]);

const _achievementsRoute = CustomRoute(
    path: 'achievements',
    name: 'AchievementsRouter',
    page: AchievementsRouterWrapper,
    transitionsBuilder: TransitionsBuilders.noTransition,
    children: [
      CustomRoute(
          path: '',
          page: MyAchievementsScreen,
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0
      ),
      CustomRoute(
          path: 'allachievements',
          page: AllAchievementsScreen,
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0
      ),
      AutoRoute(path: 'unauthorized', page:  UnauthorizedAchievementsScreen)
    ]);

const _gamesRoute = AutoRoute(
    path: 'games',
    name: 'GamesRouter',
    page: EmptyRouterPage,
    children: [AutoRoute(path: '', page: GamesMainScreen)]);

@MaterialAutoRouter(replaceInRouteName: 'Screen,Page,Route', routes: [
  CustomRoute(
    path: '/',
    page: HomeWrapperScreen,
    children: [
      AutoRoute(
          initial: true,
          path: 'splash',
          page: SplashScreen
      ),
      AutoRoute(
          path: 'home',
          name: 'HomeRoute',
          page: HomeScreen,
          children: [_accountRoute, _bookingRoute, _achievementsRoute, _gamesRoute]
      ),
    ]
  )
])
class $AppRouter {}
