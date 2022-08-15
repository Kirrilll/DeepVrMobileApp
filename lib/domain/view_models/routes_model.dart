import 'package:deepvr/domain/enums/routes.dart';
import 'package:deepvr/domain/models/tab.dart';
import 'package:deepvr/ui/screens/booking_page.dart';
import 'package:deepvr/features/games/ui/screens/games_main.dart';
import 'package:flutter/cupertino.dart';


class RoutesModel with ChangeNotifier{
  
  static const booking = '/booking';
  static const achievements  = '/achievements';
  static const person = '/';
  static const games = 'games';

  String _selectedRoute = '/';
  final List<Tab> _routes = [
    Tab(
        label: 'Игры',
        name: games,
        content: const GamesMainScreen(),
        assetIcon: 'assets/icons/nav_games_icon.png'
    ),
    Tab(
        label: 'Бронирование',
        name: booking,
        content: const BookingPage(),
        assetIcon: 'assets/icons/nav_booking_icon.png'
    ),
    Tab(
        label: 'Достижения',
        name: achievements,
        content: const GamesMainScreen(),
        assetIcon: 'assets/icons/nav_achievement_icon.png'
    ),
    // Tab(
    //     label: 'Аккаунт',
    //     name: person,
    //     content: const PersonNavigator(),
    //     assetIcon: 'assets/icons/nav_profile_icon.png'
    // )
  ];

  List<Tab> get routes => _routes;
  int get selectedRouteIndex => _routes.indexWhere((tab) => tab.name == _selectedRoute);

  void navigateToNamed(String name){
    _selectedRoute = name;
    notifyListeners();
  }
}


