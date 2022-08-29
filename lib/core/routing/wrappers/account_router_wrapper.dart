import 'package:auto_route/auto_route.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/locator.dart';

class AccountRouterWrapper extends StatefulWidget {
  const AccountRouterWrapper({Key? key}) : super(key: key);

  @override
  State<AccountRouterWrapper> createState() => _AccountRouterWrapperState();
}

class _AccountRouterWrapperState extends State<AccountRouterWrapper> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<AuthenticationService>(),
      child: Consumer<AuthenticationService>(
        builder: (_, model, __) => AutoRouter.declarative(
            routes: (_) => model.isAuthenticated
                ? [const ProfileRouter()]
                : [const AuthenticationRouter()]
        ),
      ),
    );
  }
}
