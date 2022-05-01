import 'package:deepvr/enums/routes.dart';
import 'package:flutter/cupertino.dart';

import '../pages/achievements.dart';
import '../pages/booking_page.dart';
import '../pages/games.dart';
import '../pages/profile.dart';

class RoutesModel with ChangeNotifier{
  final routes =<Routes, Widget> {
    Routes.games : const Games(),
    Routes.booking: const BookingPage(),
    Routes.achievements : const Achievements(),
    Routes.profile : const Profile()
  };


  Routes _selectedRoute = Routes.profile;
  int get selectedIndex => routes.keys.toList().indexOf(_selectedRoute);
  Widget get selectedPage => routes[_selectedRoute]!;



  void navigateToNamed(Routes routeName){
    _selectedRoute = routeName;
    notifyListeners();
  }
}


