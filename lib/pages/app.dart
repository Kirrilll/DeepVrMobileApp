import 'package:deepvr/pages/booking_page.dart';
import 'package:deepvr/pages/games.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PageView(
              controller: pageController,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children:  [
                //1 - Booking, если изменится поменять в app_model
                const BookingPage(),
                Games(pageController: pageController)
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                        icon: const Icon(Icons.book_online_outlined),
                        onPressed: (){
                          app.currPage = Pages.booking;
                          pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          },
                    ), label: 'booking'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        icon: const Icon(Icons.games),
                        onPressed: (){
                          app.currPage = Pages.games;
                          pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          },
                    ), label: 'games')
              ],
            )
        )
    );
  }
}
