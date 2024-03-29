import 'package:auto_route/auto_route.dart';
import 'package:deepvr/features/booking/data/repositories/booking_repository.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:deepvr/core/routing/observers/tabs_observer.dart';
import 'package:flutter/material.dart';
import '../../di/locator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        backgroundColor: const Color(0xFF050411),
        fontFamily: 'Gilroy',
        colorScheme: const ColorScheme.dark().copyWith(
            primary: Colors.white,
            secondary: const Color(0xFFABAFE5),
            background: const Color(0xFF050411),
            secondaryContainer: const Color(0xFF1F2032)
        ),
      ),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [TabsObserver()]
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
