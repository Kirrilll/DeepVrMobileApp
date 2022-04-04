import 'package:deepvr/pages/booking_page.dart';
import 'package:deepvr/pages/games.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  final bookingController = PageController();
  final pageController = PageController();

  var booking = locator<BookingPageModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PageView(
              controller: pageController,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Booking(bookingController: bookingController),
                const Games()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 1,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                        iconSize: 24,
                        icon: const Icon(Icons.arrow_back),
                        onPressed:  () {
                          booking.back();
                          bookingController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        }
                    ),
                    label: 'adad'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        icon: Icon(Icons.album),
                        onPressed: () => pageController.animateToPage(
                            0, duration: Duration(milliseconds: 500), curve: Curves.ease
                        ),
                    ), label: 'home'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        icon: Icon(Icons.widgets),
                        onPressed: () => pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease),
                    ), label: 'games'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        iconSize: 24,
                        icon: const Icon(Icons.arrow_forward),
                        onPressed:   () {
                          if(booking.next()){
                            bookingController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          }
                        }
                    ),
                    label: 'adad'),
              ],
            )
        )
    );
  }
}
