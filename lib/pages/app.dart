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

  final bookingController = PageController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PageView(
              controller: pageController,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //1 - Booking, если изменится поменять в app_model
                Booking(bookingController: bookingController),
                const Games()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                        iconSize: 24,
                        icon: const Icon(Icons.arrow_back),
                        onPressed:  () {
                          if(app.currPage == Pages.booking){
                            booking.back();
                            bookingController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          }
                        }
                    ),
                    label: 'prev'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        icon: const Icon(Icons.album),
                        onPressed: (){
                          //Костыли
                          booking.currViewModel = locator<GameTypeViewModel>();
                          app.currPage = Pages.booking;
                          pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          },
                    ), label: 'booking'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        icon: const Icon(Icons.widgets),
                        onPressed: (){
                          app.currPage = Pages.games;
                          pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          },
                    ), label: 'games'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        iconSize: 24,
                        icon: const Icon(Icons.arrow_forward),
                        onPressed:   () {
                          if(booking.next() && app.currPage == Pages.booking){
                            bookingController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          }
                        }
                    ),
                    label: 'next'),
              ],
            )
        )
    );
  }
}
