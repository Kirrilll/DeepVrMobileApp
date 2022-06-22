import 'package:deepvr/data/services/authentication_service.dart';
import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/ui/pages/profile/signin.dart';
import 'package:deepvr/ui/pages/profile/signup.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              final token = locator<StorageService>().getToken();
              await locator<AuthenticationService>().logout(token!);
              await locator<StorageService>().clear();
              locator<AuthenticationModel>().userController.add(User.initial());
            },
            child: const Text('Выйти')),
        const Spacer(),
        const Text('в разработке'),
        const Spacer()
      ]
    );
  }
}
