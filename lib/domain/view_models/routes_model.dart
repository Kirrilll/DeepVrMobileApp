import 'package:deepvr/domain/enums/routes.dart';
import 'package:deepvr/ui/routes/person_navigator.dart';
import 'package:deepvr/ui/screens/achievements.dart';
import 'package:deepvr/ui/screens/booking_page.dart';
import 'package:flutter/cupertino.dart';
import '../../ui/routes/games_navigator.dart';


class RoutesModel with ChangeNotifier{
  final routes =<Routes, Widget> {
    Routes.games : const GamesNavigator(),
    Routes.booking: const BookingPage(),
    Routes.achievements : const Achievements(),
    Routes.identification : const PersonNavigator()
  };


  Routes _selectedRoute = Routes.identification;
  int get selectedIndex => routes.keys.toList().indexOf(_selectedRoute);
  Widget get selectedPage => routes[_selectedRoute]!;



  void navigateToNamed(Routes routeName){
    _selectedRoute = routeName;
    notifyListeners();
  }
}


