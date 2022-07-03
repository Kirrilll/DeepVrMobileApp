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
            builder = (BuildContext _) => SettingsMain(rootContext: context);
            break;
          case 'profile/settings/update':
            builder = (BuildContext _) => const Center(child: Text('Обновить профиль'));
            break;
          case 'profile/settings/about':
            builder = (BuildContext _) => const Center(child: Text('Ононас'));
            break;
          case 'profile/settings/feedback':
            builder = (BuildContext _) => const Center(child: Text('Позвоните нам'));
            break;
          default:
            builder = (BuildContext _) => const Center(child: Text('Ошибка перемещения'));
            break;
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}
