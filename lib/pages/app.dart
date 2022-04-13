import 'package:deepvr/models/location.dart';
import 'package:deepvr/pages/booking_page.dart';
import 'package:deepvr/pages/games.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:deepvr/widgets/town_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator.dart';
import '../providers/app_model.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var booking = locator<BookingPageModel>();
  var app = locator<AppModel>();

  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then(
            (prefs){
              if(prefs.getString('userLocation') != null){
                locator<RemoteService>().init(Location.decodeJson(prefs.getString('userLocation')!).api);
              }
              else{
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      useRootNavigator: false,
                      builder: (_) => const TownDialog());
                });
              }
            }
    );


    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       useRootNavigator: false,
    //       builder: (_) => const TownDialog());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MultiProvider(
      providers: [ChangeNotifierProvider.value(value: locator<AppModel>())],
      child: Scaffold(
          body: FutureBuilder(
            future: locator.allReady(),
            builder: (context, snapshot) => snapshot.hasData
                ? ChangeNotifierProvider.value(
                    value: locator<GamesProvider>()..getGames(),
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //1 - Booking, если изменится поменять в app_model
                        const BookingPage(),
                        Games(pageController: pageController)
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          bottomNavigationBar: Consumer<AppModel>(
            builder: (context, model, _) => BottomNavigationBar(
              currentIndex: model.currPage.index,
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: const Icon(Icons.book_online_outlined),
                      onPressed: () {
                        model.currPage = Pages.booking;
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                    ),
                    label: 'бронирование'),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: const Icon(Icons.games),
                      onPressed: () {
                        model.currPage = Pages.games;
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                    ),
                    label: 'игры')
              ],
            ),
          )),
    ));
  }
}
