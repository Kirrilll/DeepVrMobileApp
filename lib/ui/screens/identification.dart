import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/domain/view_models/identification_routing_model.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/ui/screens/profile_main.dart';
import 'package:deepvr/ui/screens/signin.dart';
import 'package:deepvr/ui/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enums/identification_routes.dart';

class Identification extends StatefulWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {


  @override
  void initState() {
    locator<IdentificationRoutingModel>().init();
    super.initState();
  }

  //Пприходит User, если null регестрицая
  //Просто профиль

  //Модель user - jwt, username

  //TODO сделать на каждую форму свой provider

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: locator<IdentificationRoutingModel>(),
        child: Consumer<IdentificationRoutingModel>(
            builder: (context, model, _) => Stack(
                  children: [
                    Visibility(
                        visible: model.route == IdentificationRoutes.signIn,
                        child: const SignIn()),
                    Visibility(
                        visible: model.route == IdentificationRoutes.signUp,
                        child: const SignUp()),
                    Visibility(
                        visible: model.route == IdentificationRoutes.profile,
                        child: const ProfileMain()),
                  ],
                )
            ));
  }
}
