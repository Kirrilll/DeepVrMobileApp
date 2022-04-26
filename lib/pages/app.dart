import 'package:deepvr/enums/routes.dart';
import 'package:deepvr/models/location.dart';
import 'package:deepvr/pages/achievements.dart';
import 'package:deepvr/pages/booking_page.dart';
import 'package:deepvr/pages/games.dart';
import 'package:deepvr/pages/profile.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:deepvr/widgets/town_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator.dart';
import '../providers/routes_model.dart';

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

    // SharedPreferences.getInstance().then(
    //         (prefs){
    //           if(prefs.getString('userLocation') != null){
    //             locator<RemoteService>().init(Location.decodeJson(prefs.getString('userLocation')!).api);
    //           }
    //           else{
    //             WidgetsBinding.instance?.addPostFrameCallback((_) {
    //               showDialog(
    //                   barrierDismissible: false,
    //                   context: context,
    //                   useRootNavigator: false,
    //                   builder: (_) => const TownDialog());
    //             });
    //           }
    //         }
    // );

    locator<RemoteService>()
        .init('https://srt.vrbook.creatrix-digital.ru/api/');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ThemeData.dark().colorScheme.copyWith(
            primary: Colors.white,
            secondary: const Color(0xFFABAFE5),
            background: Colors.black,
            secondaryContainer: const Color(0xFF1F2032)),
      ),
      home: SafeArea(
          child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: locator<RoutesModel>())
        ],
        child: FutureBuilder(
            future: locator.allReady(),
            builder: (context, snapshot) => snapshot.hasData
                ? ChangeNotifierProvider.value(
                    value: locator<GamesProvider>()..getGames(),
                    child: Consumer<RoutesModel>(
                      builder: (context, model, _) => Scaffold(
                        body: model.selectedPage,
                        bottomNavigationBar: BottomNavigationBar(
                          currentIndex: model.selectedIndex,
                          type: BottomNavigationBarType.fixed,
                          selectedItemColor:
                              Theme.of(context).colorScheme.secondary,
                          showUnselectedLabels: false,
                          items: [
                            BottomNavigationBarItem(
                                icon: IconButton(
                                  icon: const Icon(Icons.book_online_outlined),
                                  onPressed: () {
                                    model.navigateToNamed(Routes.booking);
                                  },
                                ),
                                label: 'бронирование'),
                            BottomNavigationBarItem(
                                icon: IconButton(
                                  icon: const Icon(Icons.games),
                                  onPressed: () {
                                    model.navigateToNamed(Routes.games);
                                  },
                                ),
                                label: 'игры'),
                            BottomNavigationBarItem(
                                icon: IconButton(
                                  icon: const Icon(Icons.book_online_outlined),
                                  onPressed: () {
                                    model.navigateToNamed(Routes.achievements);
                                  },
                                ),
                                label: 'достижения'),
                            BottomNavigationBarItem(
                                icon: IconButton(
                                  icon: const Icon(Icons.book_online_outlined),
                                  onPressed: () {
                                    model.navigateToNamed(Routes.profile);
                                  },
                                ),
                                label: 'профиль'),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator())),
      )),
    );
  }
}
