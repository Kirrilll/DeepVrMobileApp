import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/ui/routes/app_router.gr.dart';
import 'package:deepvr/ui/routes/route_duplicate_guard.dart';
import 'package:flutter/material.dart';
import '../../locator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  final _appRouter = AppRouter(routeDuplicateGuard: RouteDuplicateGuard());
  //TODO fix nested routes
  //TODO do ui responsive
  @override
  void initState() {
    super.initState();
    locator<BookingService>().init('https://srt.vrbook.creatrix-digital.ru/api/');
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
