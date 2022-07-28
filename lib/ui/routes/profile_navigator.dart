import 'package:deepvr/domain/models/purchase.dart';
import 'package:deepvr/domain/view_models/profile_model.dart';
import 'package:deepvr/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/ui/routes/settings_navigator.dart';
import 'package:deepvr/ui/screens/profile_main.dart';
import 'package:deepvr/ui/screens/profile_settings_main.dart';
import 'package:deepvr/ui/screens/profile_statuses.dart';
import 'package:deepvr/ui/screens/purchase_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'profile/main',
      onGenerateRoute: (settings){
        WidgetBuilder builder;
        switch(settings.name){
          case 'profile/main':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const ProfileMain(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          case 'profile/statuses':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const ProfileStatuses(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          case 'profile/history':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const PurchaseHistory(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          case 'profile/settings':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const SettingsNavigator(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
            );
          default:
            return MaterialPageRoute<void>(builder: (BuildContext context) => const ProfileMain(), settings: settings);
        }
      },
    );
  }
}
