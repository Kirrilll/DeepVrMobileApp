import 'package:deepvr/domain/view_models/identification_model.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/ui/pages/profile/profile.dart';
import 'package:deepvr/ui/pages/profile/signin.dart';
import 'package:deepvr/ui/pages/profile/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../enums/identification_routes.dart';

class Identification extends StatefulWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  late IdentificationModel model;

  @override
  void initState() {
    print('damn');
    model = locator<IdentificationModel>();
    super.initState();
  }

  //Пприходит User, если null регестрицая
  //Просто профиль

  //Модель user - jwt, username

  //TODO сделать на каждую форму свой provider

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: model,
        child: Consumer<IdentificationModel>(
            builder: (context, model, _) => Stack(
                  children: [
                    Visibility(
                        visible: model.route == IdentificationRoutes.signIn,
                        child: const SignIn()),
                    Visibility(
                        visible: model.route == IdentificationRoutes.signUp,
                        child: const SignUp()),
                  ],
                )
            // Builder(builder: (context) {
            //   switch (model.route) {
            //     case IdentificationRoutes.signIn:
            //       return const SignIn();
            //     case IdentificationRoutes.signUp:
            //       return const SignUp();
            //     case IdentificationRoutes.profile:
            //       return const Profile();
            //     case IdentificationRoutes.orders:
            //       return const Center(child: Text('Заказы в разработке'));
            //     case IdentificationRoutes.options:
            //       return const Center(child: Text('Настройки в разработке'));
            //   }
            // })
            ));
  }
}
