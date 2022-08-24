import 'package:auto_route/auto_route.dart';

class RouteDuplicateGuard extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final pathFrom = router.current.path;
    final pathTo = resolver.route.path;
    if(pathFrom != pathTo){
      resolver.next();
    }
  }

}