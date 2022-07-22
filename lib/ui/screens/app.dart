import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/domain/view_models/login_model.dart';
import 'package:deepvr/enums/routes.dart';
import 'package:deepvr/domain/view_models/games_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/user.dart';
import '../../locator.dart';
import '../../domain/view_models/routes_model.dart';
import '../widgets/tab_nav_button.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator<BookingService>()
        .init('https://srt.vrbook.creatrix-digital.ru/api/');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFF050411),
        fontFamily: 'Gilroy',
        colorScheme: const ColorScheme.dark().copyWith(
            primary: Colors.white,
            secondary: const Color(0xFFABAFE5),
            background: const Color(0xFF050411),
            secondaryContainer: const Color(0xFF1F2032)),
      ),
      home: SafeArea(
          child: ChangeNotifierProvider.value(
        value: locator<RoutesModel>(),
        child: FutureBuilder(
            future: locator.allReady(),
            builder: (context, snapshot) => snapshot.hasData
                ? MultiProvider(
                    providers: [
                      ChangeNotifierProvider.value(
                          value: locator<GamesModel>()..getGames()),
                      ChangeNotifierProvider.value(
                          value: locator<AuthenticationModel>())
                    ],
                    child: Consumer<RoutesModel>(
                      builder: (context, model, _) => Scaffold(
                          body: Container(
                              color: Theme.of(context).backgroundColor,
                              child: model.selectedPage),
                          //TODO засунуть в отдельный виджет верстку IconButton
                          bottomNavigationBar: Container(
                            color: Theme.of(context).backgroundColor,
                            padding: const EdgeInsets.fromLTRB(35, 11, 35, 15),
                            height: 72,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TabNavButton(
                                  navToNamed: () =>
                                      model.navigateToNamed(Routes.games),
                                  iconPath: 'assets/icons/nav_games_icon.png',
                                  label: 'Игры',
                                  isActive: model.selectedIndex == 0,
                                ),
                                TabNavButton(
                                  navToNamed: () =>
                                      model.navigateToNamed(Routes.booking),
                                  label: 'Бронирование',
                                  iconPath: 'assets/icons/nav_booking_icon.png',
                                  isActive: model.selectedIndex == 1,
                                ),
                                TabNavButton(
                                  navToNamed: () => model
                                      .navigateToNamed(Routes.achievements),
                                  label: 'Достижения',
                                  iconPath:
                                      'assets/icons/nav_achievement_icon.png',
                                  isActive: model.selectedIndex == 2,
                                ),
                                TabNavButton(
                                    navToNamed: () => model
                                        .navigateToNamed(Routes.identification),
                                    label: 'Аккаунт',
                                    iconPath:
                                        'assets/icons/nav_profile_icon.png',
                                    isActive: model.selectedIndex == 3),
                              ],
                            ),
                          )),
                    ),
                  )
                : const Center(child: CircularProgressIndicator())),
      )),
    );
  }
}
