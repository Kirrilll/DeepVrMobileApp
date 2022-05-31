import 'package:deepvr/ui/pages/profile/signin.dart';
import 'package:deepvr/ui/pages/profile/signup.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  //Пприходит User, если null регестрицая
  //Просто профиль

  //Модель user - jwt, username

  //TODO сделать на каждую форму свой provider

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        SignUp(),
        SignIn(),
      ],
    );

      const SignUp();
  }
}
