import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:deepvr/ui/routes/account_router_wrapper.dart';
import 'package:deepvr/ui/routes/route_duplicate_guard.dart';
import 'package:deepvr/ui/screens/about_screen.dart';
import 'package:deepvr/ui/screens/all_achievements_screen.dart';
import 'package:deepvr/ui/screens/booking_page.dart';
import 'package:deepvr/ui/screens/feedback_screen.dart';
import 'package:deepvr/ui/screens/games_main.dart';
import 'package:deepvr/ui/screens/home_screen.dart';
import 'package:deepvr/ui/screens/home_wrapper_screen.dart';
import 'package:deepvr/ui/screens/my_achievements_screen.dart';
import 'package:deepvr/ui/screens/profile_main.dart';
import 'package:deepvr/ui/screens/profile_settings_main.dart';
import 'package:deepvr/ui/screens/profile_statuses.dart';
import 'package:deepvr/ui/screens/purchase_history.dart';
import 'package:deepvr/ui/screens/signin.dart';
import 'package:deepvr/ui/screens/signup.dart';
import 'package:deepvr/ui/screens/splash_screen.dart';
import 'package:deepvr/ui/screens/update_screen.dart';
import 'package:deepvr/ui/templates/profile_template.dart';

const _accountRoute = AutoRoute(
    initial: true,
    path: 'account',
    name: 'AccountRouter',
    page: AccountRouterWrapper,
    guards: [
      RouteDuplicateGuard
    ],
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
    guards: [RouteDuplicateGuard],
    name: 'BookingRouter',
    page: EmptyRouterPage,
    children: [AutoRoute(path: '', page: BookingPage)]);

const _achievementsRoute = AutoRoute(
    path: 'achievements',
    name: 'AchievementsRouter',
    guards: [RouteDuplicateGuard],
    page: EmptyRouterPage,
    children: [
      AutoRoute(path: '', page: AllAchievementsScreen),
      AutoRoute(path: 'myachievements', page: MyAchievementsScreen)
    ]);

const _gamesRoute = AutoRoute(
    path: 'games',
    guards: [RouteDuplicateGuard],
    name: 'GamesRouter',
    page: EmptyRouterPage,
    children: [AutoRoute(path: '', page: GamesMainScreen)]);

@MaterialAutoRouter(replaceInRouteName: 'Screen,Page,Route', routes: [
  AutoRoute(
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
          page: HomeScreen,
          children: [_accountRoute, _bookingRoute, _achievementsRoute, _gamesRoute]
      )
    ]
  )
])
class $AppRouter {}
