import 'package:deepvr/ui/screens/event_screen.dart';
import 'package:deepvr/ui/screens/games_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamesNavigator extends StatefulWidget {
  const GamesNavigator({Key? key}) : super(key: key);

  @override
  _GamesNavigatorState createState() => _GamesNavigatorState();
}

class _GamesNavigatorState extends State<GamesNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'games/main',
      onGenerateRoute: (settings){
        WidgetBuilder builder;
        switch(settings.name){
          case 'games/main':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const GamesMainScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          case 'games/event':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const EventScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
                fullscreenDialog: true
            );
          default:
            return MaterialPageRoute<void>(
                builder: (BuildContext _) => const Center(child: Text('ошибка роутинга')),
                settings: settings
            );
        }
      },
    );
  }
}
