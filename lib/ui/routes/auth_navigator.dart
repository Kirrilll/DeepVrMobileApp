import 'package:deepvr/ui/screens/signin.dart';
import 'package:deepvr/ui/screens/signup.dart';
import 'package:deepvr/usecases/delegates/no_anim_transition_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'auth/signIn',
      transitionDelegate: NoAnimationTransitionDelegate(),
      onGenerateRoute: (settings){
        WidgetBuilder builder;
        switch(settings.name){
          case 'auth/signIn':
            builder = (BuildContext context) => const SignIn();
            break;
          case 'auth/signUp':
            builder = (BuildContext context) => const SignUp();
            break;
          default:
            builder = (BuildContext _) => const Center(child: Text('ошибка роутинга'),);
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}
