import 'package:auto_route/auto_route.dart';

class Tab{
 final String label;
 final String iconPath;
 final PageRouteInfo route;

 const Tab({
    required this.label,
    required this.iconPath,
    required this.route,
  });
}