import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class UnauthorizedAchievementsScreen extends StatelessWidget {
  const UnauthorizedAchievementsScreen({Key? key}) : super(key: key);

  static final _router = locator<AppRouter>();

  void navToRegistration(){
      _router
          .navigateNamed('account')
          .then((value) => _router.pushNamed('signup'));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Чтобы увидеть достижения необходимо зарегестрироваться'),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: navToRegistration,
              child: const Text('Зарегестрироваться')
          )
        ],
      ),
    );
  }
}
