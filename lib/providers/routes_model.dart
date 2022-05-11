import 'package:deepvr/enums/routes.dart';
import 'package:flutter/cupertino.dart';

import '../ui/pages/achievements.dart';
import '../ui/pages/booking_page.dart';
import '../ui/pages/games.dart';
import '../ui/pages/profile.dart';

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


