import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../di/locator.dart';

class HomeWrapperScreen extends StatelessWidget {
  const HomeWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locator.allReady(),
        builder: (_, snapshot) => AutoRouter.declarative(
            routes: (_) => snapshot.hasData
                ? [const HomeRoute()]
                : [const SplashScreenRoute()]
        )
    );

  }
}
