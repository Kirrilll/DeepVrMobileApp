import 'package:deepvr/ui/screens/profile_settings_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsNavigator extends StatelessWidget {
  const SettingsNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'profile/settings/main',
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch(settings.name){
          case 'profile/settings/main':
            return PageRouteBuilder(
                pageBuilder: (_, animation, secondaryAnimation) => SettingsMain(rootContext: context),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          case 'profile/settings/update':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const Center(child: Text('Обновить профиль'),),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          case 'profile/settings/about':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const Center(child: Text('О нас'),),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          case 'profile/settings/feedback':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const Center(child: Text('Звонить сюда'),),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          default:
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const Center(child: Text('Ошибка перемещения'),),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
        }
      },
    );
  }
}
