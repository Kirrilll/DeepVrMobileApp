import 'package:deepvr/ui/screens/signin.dart';
import 'package:deepvr/ui/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthNavigator extends StatefulWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  State<AuthNavigator> createState() => _AuthNavigatorState();
}

class _AuthNavigatorState extends State<AuthNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'auth/signIn',
      onGenerateRoute: (settings){
        WidgetBuilder builder;
        switch(settings.name){
          case 'auth/signIn':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const SignInScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero
            );
          case 'auth/signUp':
            return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const SignUpScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
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
