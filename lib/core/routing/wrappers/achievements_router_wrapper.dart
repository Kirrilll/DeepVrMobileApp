import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:deepvr/features/achievements/ui/screens/unauth_achievements_screen.dart';
import 'package:deepvr/features/authentication/domain/view_models/authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/achievements/domain/view_models/achievement_model.dart';
import '../../../features/achievements/ui/widgets/achievements_switcher_button.dart';
import '../../domain/locator.dart';
import '../../usecases/special_types/fetching_state.dart';

class AchievementsRouterWrapper extends StatefulWidget {
  const AchievementsRouterWrapper({Key? key}) : super(key: key);

  @override
  State<AchievementsRouterWrapper> createState() => _AchievementsRouterWrapperState();
}

class _AchievementsRouterWrapperState extends State<AchievementsRouterWrapper> {
  bool _isAllAchievements = false;

  void updateState() =>
      setState(() => _isAllAchievements = !_isAllAchievements);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locator<AchievementModel>()),
        ChangeNotifierProvider.value(value: locator<AuthenticationModel>())
      ],
      child: Consumer<AuthenticationModel>(
        builder: (_, authenticationModel, __) => authenticationModel.isAuthenticated
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 21, horizontal: 16),
                child: Column(
                  children: [
                    AchievementsSwitcherButton(
                      isAllAchievements: _isAllAchievements,
                      switchScreen: updateState,
                    ),
                    const SizedBox(height: 26),
                    Expanded(
                      child:
                          Consumer<AchievementModel>(builder: (_, model, __) {
                        switch (model.fetchingStatus) {
                          case FetchingState.loading:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case FetchingState.successful:
                            return AutoRouter.declarative(
                                onPopRoute: (route, result) => updateState(),
                                routes: (handler) => [
                                      const MyAchievementsScreenRoute(),
                                      if (_isAllAchievements)
                                        const AllAchievementsScreenRoute()
                                    ]);
                          case FetchingState.error:
                            return const Center(child: Text('Ошибка'));
                          default:
                            return const SizedBox();
                        }
                      }),
                    )
                  ],
                ),
              )
            : const UnauthorizedAchievementsScreen(),
      ),
    );
  }
}
