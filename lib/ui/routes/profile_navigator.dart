import 'package:deepvr/domain/view_models/profile_model.dart';
import 'package:deepvr/ui/routes/settings_navigator.dart';
import 'package:deepvr/ui/screens/profile_main.dart';
import 'package:deepvr/ui/screens/profile_settings_main.dart';
import 'package:deepvr/ui/screens/profile_statuses.dart';
import 'package:deepvr/ui/screens/purchase_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class ProfileNavigator extends StatefulWidget {
  const ProfileNavigator({Key? key}) : super(key: key);

  @override
  _ProfileNavigatorState createState() => _ProfileNavigatorState();
}

class _ProfileNavigatorState extends State<ProfileNavigator> {

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'profile/main',
      onGenerateRoute: (settings){
        WidgetBuilder builder;
        switch(settings.name){
          case 'profile/main':
            builder = (BuildContext context) => const ProfileMain();
            break;
          case 'profile/statuses':
            builder = (BuildContext context) => const ProfileStatuses();
            break;
          case 'profile/history':
            builder = (BuildContext context) => const PurchaseHistory();
            break;
          case 'profile/settings':
            builder = (BuildContext context) => const SettingsNavigator();
            break;
          default:
            builder = (BuildContext _) => const ProfileMain();
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}
