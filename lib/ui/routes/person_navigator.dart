import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/ui/routes/auth_navigator.dart';
import 'package:deepvr/ui/routes/profile_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonNavigator extends StatelessWidget {
  const PersonNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationModel>(
        builder: (context, model, _) => model.isAuthenticated
            ? const ProfileNavigator()
            : const AuthNavigator()
    );
  }
}
