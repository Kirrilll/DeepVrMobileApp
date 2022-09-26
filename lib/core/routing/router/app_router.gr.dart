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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i20;

import '../../../domain/models/booking.dart' as _i22;
import '../../../features/achievements/ui/screens/all_achievements_screen.dart'
    as _i17;
import '../../../features/achievements/ui/screens/my_achievements_screen.dart'
    as _i16;
import '../../../features/achievements/ui/screens/unauth_achievements_screen.dart'
    as _i18;
import '../../../features/authentication/ui/screens/signin.dart' as _i5;
import '../../../features/authentication/ui/screens/signup.dart' as _i6;
import '../../../features/booking/ui/screens/booking_page.dart' as _i14;
import '../../../features/booking/ui/screens/successful_screen.dart' as _i15;
import '../../../features/games/ui/screens/games_screen.dart' as _i19;
import '../../../features/profile/ui/screens/about_screen.dart' as _i11;
import '../../../features/profile/ui/screens/feedback_screen.dart' as _i12;
import '../../../features/profile/ui/screens/profile_main.dart' as _i7;
import '../../../features/profile/ui/screens/profile_settings_main.dart'
    as _i10;
import '../../../features/profile/ui/screens/profile_statuses.dart' as _i8;
import '../../../features/profile/ui/screens/purchase_history.dart' as _i9;
import '../../../features/profile/ui/screens/update_screen.dart' as _i13;
import '../../ui/screens/home_screen.dart' as _i1;
import '../guards/route_duplicate_guard.dart' as _i21;
import '../wrappers/account_router_wrapper.dart' as _i2;
import '../wrappers/achievements_router_wrapper.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter({
    _i20.GlobalKey<_i20.NavigatorState>? navigatorKey,
    required this.routeDuplicateGuard,
  }) : super(navigatorKey);

  final _i21.RouteDuplicateGuard routeDuplicateGuard;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    AccountRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AccountRouterWrapper(),
      );
    },
    BookingRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    AchievementsRouter.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.AchievementsRouterWrapper(),
        transitionsBuilder: _i3.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GamesRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    AuthenticationRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    SignInScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SignInScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    ProfileMainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileMain(),
      );
    },
    ProfileStatusesRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileStatuses(),
      );
    },
    PurchaseHistoryRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.PurchaseHistory(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    SettingsMainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.SettingsMain(),
      );
    },
    AboutScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AboutScreen(),
      );
    },
    FeedbackScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.FeedbackScreen(),
      );
    },
    UpdateScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.UpdateScreen(),
      );
    },
    BookingPageRoute.name: (routeData) {
      final args = routeData.argsAs<BookingPageRouteArgs>(
          orElse: () => const BookingPageRouteArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.BookingPage(
          key: args.key,
          initialBooking: args.initialBooking,
        ),
      );
    },
    SuccessfulScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.SuccessfulScreen(),
      );
    },
    MyAchievementsScreenRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.MyAchievementsScreen(),
        transitionsBuilder: _i3.TransitionsBuilders.noTransition,
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AllAchievementsScreenRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i17.AllAchievementsScreen(),
        transitionsBuilder: _i3.TransitionsBuilders.noTransition,
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnauthorizedAchievementsScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.UnauthorizedAchievementsScreen(),
      );
    },
    GamesMainScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.GamesMainScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'home',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          HomeRoute.name,
          path: 'home',
          children: [
            _i3.RouteConfig(
              '#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'account',
              fullMatch: true,
            ),
            _i3.RouteConfig(
              AccountRouter.name,
              path: 'account',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  AuthenticationRouter.name,
                  path: 'auth',
                  parent: AccountRouter.name,
                  children: [
                    _i3.RouteConfig(
                      '#redirect',
                      path: '',
                      parent: AuthenticationRouter.name,
                      redirectTo: 'signin',
                      fullMatch: true,
                    ),
                    _i3.RouteConfig(
                      SignInScreenRoute.name,
                      path: 'signin',
                      parent: AuthenticationRouter.name,
                    ),
                    _i3.RouteConfig(
                      SignUpScreenRoute.name,
                      path: 'signup',
                      parent: AuthenticationRouter.name,
                    ),
                  ],
                ),
                _i3.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile',
                  parent: AccountRouter.name,
                  children: [
                    _i3.RouteConfig(
                      ProfileMainRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i3.RouteConfig(
                      ProfileStatusesRoute.name,
                      path: 'statuses',
                      parent: ProfileRouter.name,
                    ),
                    _i3.RouteConfig(
                      PurchaseHistoryRoute.name,
                      path: 'history',
                      parent: ProfileRouter.name,
                    ),
                    _i3.RouteConfig(
                      SettingsRouter.name,
                      path: 'settings',
                      parent: ProfileRouter.name,
                      guards: [routeDuplicateGuard],
                      children: [
                        _i3.RouteConfig(
                          SettingsMainRoute.name,
                          path: '',
                          parent: SettingsRouter.name,
                        ),
                        _i3.RouteConfig(
                          AboutScreenRoute.name,
                          path: 'about',
                          parent: SettingsRouter.name,
                        ),
                        _i3.RouteConfig(
                          FeedbackScreenRoute.name,
                          path: 'feedback',
                          parent: SettingsRouter.name,
                        ),
                        _i3.RouteConfig(
                          UpdateScreenRoute.name,
                          path: 'update',
                          parent: SettingsRouter.name,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            _i3.RouteConfig(
              BookingRouter.name,
              path: 'booking',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  BookingPageRoute.name,
                  path: '',
                  parent: BookingRouter.name,
                ),
                _i3.RouteConfig(
                  SuccessfulScreenRoute.name,
                  path: 'successful',
                  parent: BookingRouter.name,
                ),
              ],
            ),
            _i3.RouteConfig(
              AchievementsRouter.name,
              path: 'achievements',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  MyAchievementsScreenRoute.name,
                  path: '',
                  parent: AchievementsRouter.name,
                ),
                _i3.RouteConfig(
                  AllAchievementsScreenRoute.name,
                  path: 'allachievements',
                  parent: AchievementsRouter.name,
                ),
                _i3.RouteConfig(
                  UnauthorizedAchievementsScreenRoute.name,
                  path: 'unauthorized',
                  parent: AchievementsRouter.name,
                ),
              ],
            ),
            _i3.RouteConfig(
              GamesRouter.name,
              path: 'games',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(
                  GamesMainScreenRoute.name,
                  path: '',
                  parent: GamesRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.AccountRouterWrapper]
class AccountRouter extends _i3.PageRouteInfo<void> {
  const AccountRouter({List<_i3.PageRouteInfo>? children})
      : super(
          AccountRouter.name,
          path: 'account',
          initialChildren: children,
        );

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class BookingRouter extends _i3.PageRouteInfo<void> {
  const BookingRouter({List<_i3.PageRouteInfo>? children})
      : super(
          BookingRouter.name,
          path: 'booking',
          initialChildren: children,
        );

  static const String name = 'BookingRouter';
}

/// generated route for
/// [_i4.AchievementsRouterWrapper]
class AchievementsRouter extends _i3.PageRouteInfo<void> {
  const AchievementsRouter({List<_i3.PageRouteInfo>? children})
      : super(
          AchievementsRouter.name,
          path: 'achievements',
          initialChildren: children,
        );

  static const String name = 'AchievementsRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class GamesRouter extends _i3.PageRouteInfo<void> {
  const GamesRouter({List<_i3.PageRouteInfo>? children})
      : super(
          GamesRouter.name,
          path: 'games',
          initialChildren: children,
        );

  static const String name = 'GamesRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class AuthenticationRouter extends _i3.PageRouteInfo<void> {
  const AuthenticationRouter({List<_i3.PageRouteInfo>? children})
      : super(
          AuthenticationRouter.name,
          path: 'auth',
          initialChildren: children,
        );

  static const String name = 'AuthenticationRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ProfileRouter extends _i3.PageRouteInfo<void> {
  const ProfileRouter({List<_i3.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i5.SignInScreen]
class SignInScreenRoute extends _i3.PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(
          SignInScreenRoute.name,
          path: 'signin',
        );

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreenRoute extends _i3.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: 'signup',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i7.ProfileMain]
class ProfileMainRoute extends _i3.PageRouteInfo<void> {
  const ProfileMainRoute()
      : super(
          ProfileMainRoute.name,
          path: '',
        );

  static const String name = 'ProfileMainRoute';
}

/// generated route for
/// [_i8.ProfileStatuses]
class ProfileStatusesRoute extends _i3.PageRouteInfo<void> {
  const ProfileStatusesRoute()
      : super(
          ProfileStatusesRoute.name,
          path: 'statuses',
        );

  static const String name = 'ProfileStatusesRoute';
}

/// generated route for
/// [_i9.PurchaseHistory]
class PurchaseHistoryRoute extends _i3.PageRouteInfo<void> {
  const PurchaseHistoryRoute()
      : super(
          PurchaseHistoryRoute.name,
          path: 'history',
        );

  static const String name = 'PurchaseHistoryRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class SettingsRouter extends _i3.PageRouteInfo<void> {
  const SettingsRouter({List<_i3.PageRouteInfo>? children})
      : super(
          SettingsRouter.name,
          path: 'settings',
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i10.SettingsMain]
class SettingsMainRoute extends _i3.PageRouteInfo<void> {
  const SettingsMainRoute()
      : super(
          SettingsMainRoute.name,
          path: '',
        );

  static const String name = 'SettingsMainRoute';
}

/// generated route for
/// [_i11.AboutScreen]
class AboutScreenRoute extends _i3.PageRouteInfo<void> {
  const AboutScreenRoute()
      : super(
          AboutScreenRoute.name,
          path: 'about',
        );

  static const String name = 'AboutScreenRoute';
}

/// generated route for
/// [_i12.FeedbackScreen]
class FeedbackScreenRoute extends _i3.PageRouteInfo<void> {
  const FeedbackScreenRoute()
      : super(
          FeedbackScreenRoute.name,
          path: 'feedback',
        );

  static const String name = 'FeedbackScreenRoute';
}

/// generated route for
/// [_i13.UpdateScreen]
class UpdateScreenRoute extends _i3.PageRouteInfo<void> {
  const UpdateScreenRoute()
      : super(
          UpdateScreenRoute.name,
          path: 'update',
        );

  static const String name = 'UpdateScreenRoute';
}

/// generated route for
/// [_i14.BookingPage]
class BookingPageRoute extends _i3.PageRouteInfo<BookingPageRouteArgs> {
  BookingPageRoute({
    _i20.Key? key,
    _i22.Booking? initialBooking,
  }) : super(
          BookingPageRoute.name,
          path: '',
          args: BookingPageRouteArgs(
            key: key,
            initialBooking: initialBooking,
          ),
        );

  static const String name = 'BookingPageRoute';
}

class BookingPageRouteArgs {
  const BookingPageRouteArgs({
    this.key,
    this.initialBooking,
  });

  final _i20.Key? key;

  final _i22.Booking? initialBooking;

  @override
  String toString() {
    return 'BookingPageRouteArgs{key: $key, initialBooking: $initialBooking}';
  }
}

/// generated route for
/// [_i15.SuccessfulScreen]
class SuccessfulScreenRoute extends _i3.PageRouteInfo<void> {
  const SuccessfulScreenRoute()
      : super(
          SuccessfulScreenRoute.name,
          path: 'successful',
        );

  static const String name = 'SuccessfulScreenRoute';
}

/// generated route for
/// [_i16.MyAchievementsScreen]
class MyAchievementsScreenRoute extends _i3.PageRouteInfo<void> {
  const MyAchievementsScreenRoute()
      : super(
          MyAchievementsScreenRoute.name,
          path: '',
        );

  static const String name = 'MyAchievementsScreenRoute';
}

/// generated route for
/// [_i17.AllAchievementsScreen]
class AllAchievementsScreenRoute extends _i3.PageRouteInfo<void> {
  const AllAchievementsScreenRoute()
      : super(
          AllAchievementsScreenRoute.name,
          path: 'allachievements',
        );

  static const String name = 'AllAchievementsScreenRoute';
}

/// generated route for
/// [_i18.UnauthorizedAchievementsScreen]
class UnauthorizedAchievementsScreenRoute extends _i3.PageRouteInfo<void> {
  const UnauthorizedAchievementsScreenRoute()
      : super(
          UnauthorizedAchievementsScreenRoute.name,
          path: 'unauthorized',
        );

  static const String name = 'UnauthorizedAchievementsScreenRoute';
}

/// generated route for
/// [_i19.GamesMainScreen]
class GamesMainScreenRoute extends _i3.PageRouteInfo<void> {
  const GamesMainScreenRoute()
      : super(
          GamesMainScreenRoute.name,
          path: '',
        );

  static const String name = 'GamesMainScreenRoute';
}
