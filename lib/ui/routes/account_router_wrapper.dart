import 'package:auto_route/auto_route.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/ui/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class AccountRouterWrapper extends StatefulWidget {
  const AccountRouterWrapper({Key? key}) : super(key: key);

  @override
  State<AccountRouterWrapper> createState() => _AccountRouterWrapperState();
}

class _AccountRouterWrapperState extends State<AccountRouterWrapper> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<AuthenticationModel>(),
      child: Consumer<AuthenticationModel>(
        builder: (_, model, __) => AutoRouter.declarative(
            routes: (_) => model.isAuthenticated
                ? [ProfileRouter()]
                : [const AuthenticationRouter()]
        ),
      ),
    );
  }
}
