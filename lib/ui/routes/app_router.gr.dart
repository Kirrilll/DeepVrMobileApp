// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i19;

import '../screens/about_screen.dart' as _i12;
import '../screens/all_achievements_screen.dart' as _i16;
import '../screens/booking_page.dart' as _i15;
import '../screens/feedback_screen.dart' as _i13;
import '../../features/games/ui/screens/games_main.dart' as _i18;
import '../screens/home_screen.dart' as _i3;
import '../screens/home_wrapper_screen.dart' as _i1;
import '../screens/my_achievements_screen.dart' as _i17;
import '../screens/profile_main.dart' as _i8;
import '../screens/profile_settings_main.dart' as _i11;
import '../screens/profile_statuses.dart' as _i9;
import '../screens/purchase_history.dart' as _i10;
import '../screens/signin.dart' as _i6;
import '../screens/signup.dart' as _i7;
import '../screens/splash_screen.dart' as _i2;
import '../screens/update_screen.dart' as _i14;
import 'account_router_wrapper.dart' as _i4;
import 'route_duplicate_guard.dart' as _i20;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i19.GlobalKey<_i19.NavigatorState>? navigatorKey,
      required this.routeDuplicateGuard})
      : super(navigatorKey);

  final _i20.RouteDuplicateGuard routeDuplicateGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeWrapperScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeWrapperScreen());
    },
    SplashScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    AccountRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AccountRouterWrapper());
    },
    BookingRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    AchievementsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    GamesRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    AuthenticationRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SignInScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SignInScreen());
    },
    SignUpScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SignUpScreen());
    },
    ProfileMainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfileMain());
    },
    ProfileStatusesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfileStatuses());
    },
    PurchaseHistoryRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.PurchaseHistory());
    },
    SettingsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SettingsMainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SettingsMain());
    },
    AboutScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AboutScreen());
    },
    FeedbackScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.FeedbackScreen());
    },
    UpdateScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.UpdateScreen());
    },
    BookingPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.BookingPage());
    },
    AllAchievementsScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.AllAchievementsScreen());
    },
    MyAchievementsScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.MyAchievementsScreen());
    },
    GamesMainScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.GamesMainScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeWrapperScreenRoute.name, path: '/', children: [
          _i5.RouteConfig('#redirect',
              path: '',
              parent: HomeWrapperScreenRoute.name,
              redirectTo: 'splash',
              fullMatch: true),
          _i5.RouteConfig(SplashScreenRoute.name,
              path: 'splash', parent: HomeWrapperScreenRoute.name),
          _i5.RouteConfig(HomeScreenRoute.name,
              path: 'home',
              parent: HomeWrapperScreenRoute.name,
              children: [
                _i5.RouteConfig('#redirect',
                    path: '',
                    parent: HomeScreenRoute.name,
                    redirectTo: 'account',
                    fullMatch: true),
                _i5.RouteConfig(AccountRouter.name,
                    path: 'account',
                    parent: HomeScreenRoute.name,
                    guards: [
                      routeDuplicateGuard
                    ],
                    children: [
                      _i5.RouteConfig(AuthenticationRouter.name,
                          path: 'auth',
                          parent: AccountRouter.name,
                          children: [
                            _i5.RouteConfig('#redirect',
                                path: '',
                                parent: AuthenticationRouter.name,
                                redirectTo: 'signin',
                                fullMatch: true),
                            _i5.RouteConfig(SignInScreenRoute.name,
                                path: 'signin',
                                parent: AuthenticationRouter.name),
                            _i5.RouteConfig(SignUpScreenRoute.name,
                                path: 'signup',
                                parent: AuthenticationRouter.name)
                          ]),
                      _i5.RouteConfig(ProfileRouter.name,
                          path: 'profile',
                          parent: AccountRouter.name,
                          children: [
                            _i5.RouteConfig(ProfileMainRoute.name,
                                path: '', parent: ProfileRouter.name),
                            _i5.RouteConfig(ProfileStatusesRoute.name,
                                path: 'statuses', parent: ProfileRouter.name),
                            _i5.RouteConfig(PurchaseHistoryRoute.name,
                                path: 'history', parent: ProfileRouter.name),
                            _i5.RouteConfig(SettingsRouter.name,
                                path: 'settings',
                                parent: ProfileRouter.name,
                                guards: [
                                  routeDuplicateGuard
                                ],
                                children: [
                                  _i5.RouteConfig(SettingsMainRoute.name,
                                      path: '', parent: SettingsRouter.name),
                                  _i5.RouteConfig(AboutScreenRoute.name,
                                      path: 'about',
                                      parent: SettingsRouter.name),
                                  _i5.RouteConfig(FeedbackScreenRoute.name,
                                      path: 'feedback',
                                      parent: SettingsRouter.name),
                                  _i5.RouteConfig(UpdateScreenRoute.name,
                                      path: 'update',
                                      parent: SettingsRouter.name)
                                ])
                          ])
                    ]),
                _i5.RouteConfig(BookingRouter.name,
                    path: 'booking',
                    parent: HomeScreenRoute.name,
                    guards: [
                      routeDuplicateGuard
                    ],
                    children: [
                      _i5.RouteConfig(BookingPageRoute.name,
                          path: '', parent: BookingRouter.name)
                    ]),
                _i5.RouteConfig(AchievementsRouter.name,
                    path: 'achievements',
                    parent: HomeScreenRoute.name,
                    guards: [
                      routeDuplicateGuard
                    ],
                    children: [
                      _i5.RouteConfig(AllAchievementsScreenRoute.name,
                          path: '', parent: AchievementsRouter.name),
                      _i5.RouteConfig(MyAchievementsScreenRoute.name,
                          path: 'myachievements',
                          parent: AchievementsRouter.name)
                    ]),
                _i5.RouteConfig(GamesRouter.name,
                    path: 'games',
                    parent: HomeScreenRoute.name,
                    guards: [
                      routeDuplicateGuard
                    ],
                    children: [
                      _i5.RouteConfig(GamesMainScreenRoute.name,
                          path: '', parent: GamesRouter.name)
                    ])
              ])
        ])
      ];
}

/// generated route for
/// [_i1.HomeWrapperScreen]
class HomeWrapperScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeWrapperScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeWrapperScreenRoute.name,
            path: '/', initialChildren: children);

  static const String name = 'HomeWrapperScreenRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: 'splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeScreenRoute.name, path: 'home', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i4.AccountRouterWrapper]
class AccountRouter extends _i5.PageRouteInfo<void> {
  const AccountRouter({List<_i5.PageRouteInfo>? children})
      : super(AccountRouter.name, path: 'account', initialChildren: children);

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class BookingRouter extends _i5.PageRouteInfo<void> {
  const BookingRouter({List<_i5.PageRouteInfo>? children})
      : super(BookingRouter.name, path: 'booking', initialChildren: children);

  static const String name = 'BookingRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class AchievementsRouter extends _i5.PageRouteInfo<void> {
  const AchievementsRouter({List<_i5.PageRouteInfo>? children})
      : super(AchievementsRouter.name,
            path: 'achievements', initialChildren: children);

  static const String name = 'AchievementsRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class GamesRouter extends _i5.PageRouteInfo<void> {
  const GamesRouter({List<_i5.PageRouteInfo>? children})
      : super(GamesRouter.name, path: 'games', initialChildren: children);

  static const String name = 'GamesRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class AuthenticationRouter extends _i5.PageRouteInfo<void> {
  const AuthenticationRouter({List<_i5.PageRouteInfo>? children})
      : super(AuthenticationRouter.name,
            path: 'auth', initialChildren: children);

  static const String name = 'AuthenticationRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ProfileRouter extends _i5.PageRouteInfo<void> {
  const ProfileRouter({List<_i5.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i6.SignInScreen]
class SignInScreenRoute extends _i5.PageRouteInfo<void> {
  const SignInScreenRoute() : super(SignInScreenRoute.name, path: 'signin');

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpScreenRoute extends _i5.PageRouteInfo<void> {
  const SignUpScreenRoute() : super(SignUpScreenRoute.name, path: 'signup');

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i8.ProfileMain]
class ProfileMainRoute extends _i5.PageRouteInfo<void> {
  const ProfileMainRoute() : super(ProfileMainRoute.name, path: '');

  static const String name = 'ProfileMainRoute';
}

/// generated route for
/// [_i9.ProfileStatuses]
class ProfileStatusesRoute extends _i5.PageRouteInfo<void> {
  const ProfileStatusesRoute()
      : super(ProfileStatusesRoute.name, path: 'statuses');

  static const String name = 'ProfileStatusesRoute';
}

/// generated route for
/// [_i10.PurchaseHistory]
class PurchaseHistoryRoute extends _i5.PageRouteInfo<void> {
  const PurchaseHistoryRoute()
      : super(PurchaseHistoryRoute.name, path: 'history');

  static const String name = 'PurchaseHistoryRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class SettingsRouter extends _i5.PageRouteInfo<void> {
  const SettingsRouter({List<_i5.PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i11.SettingsMain]
class SettingsMainRoute extends _i5.PageRouteInfo<void> {
  const SettingsMainRoute() : super(SettingsMainRoute.name, path: '');

  static const String name = 'SettingsMainRoute';
}

/// generated route for
/// [_i12.AboutScreen]
class AboutScreenRoute extends _i5.PageRouteInfo<void> {
  const AboutScreenRoute() : super(AboutScreenRoute.name, path: 'about');

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i13.FeedbackScreen]
class FeedbackScreenRoute extends _i5.PageRouteInfo<void> {
  const FeedbackScreenRoute()
      : super(FeedbackScreenRoute.name, path: 'feedback');

  static const String name = 'FeedbackScreenRoute';
}

/// generated route for
/// [_i14.UpdateScreen]
class UpdateScreenRoute extends _i5.PageRouteInfo<void> {
  const UpdateScreenRoute() : super(UpdateScreenRoute.name, path: 'update');

  static const String name = 'UpdateScreenRoute';
}

/// generated route for
/// [_i15.BookingPage]
class BookingPageRoute extends _i5.PageRouteInfo<void> {
  const BookingPageRoute() : super(BookingPageRoute.name, path: '');

  static const String name = 'BookingPageRoute';
}

/// generated route for
/// [_i16.AllAchievementsScreen]
class AllAchievementsScreenRoute extends _i5.PageRouteInfo<void> {
  const AllAchievementsScreenRoute()
      : super(AllAchievementsScreenRoute.name, path: '');

  static const String name = 'AllAchievementsScreenRoute';
}

/// generated route for
/// [_i17.MyAchievementsScreen]
class MyAchievementsScreenRoute extends _i5.PageRouteInfo<void> {
  const MyAchievementsScreenRoute()
      : super(MyAchievementsScreenRoute.name, path: 'myachievements');

  static const String name = 'MyAchievementsScreenRoute';
}

/// generated route for
/// [_i18.GamesMainScreen]
class GamesMainScreenRoute extends _i5.PageRouteInfo<void> {
  const GamesMainScreenRoute() : super(GamesMainScreenRoute.name, path: '');

  static const String name = 'GamesMainScreenRoute';
}
