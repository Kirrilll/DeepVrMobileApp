import 'package:auto_route/auto_route.dart';
import 'package:deepvr/ui/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTemplate extends StatelessWidget {
  const ProfileTemplate(
      {
        this.title = 'ПРОФИЛЬ',
        this.navigatorState,
        required this.content,
        Key? key
      })
      : super(key: key);

  final GlobalKey<NavigatorState>? navigatorState;
  final Widget content;
  final String title;

  //TODO пофиксить этот костыль
  void navToSettings(BuildContext context) => context.router.push(const SettingsRouter());
  bool canBack(BuildContext context) => context.router.current.route.name == 'SettingsMainRoute'
      || (context.router.navigatorKey.currentState?.canPop() ?? false);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                canBack(context)
                    ?  Align(
                        alignment: Alignment.centerLeft,
                        child: InkResponse(
                            onTap: () => context.router.pop(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                    Icons.arrow_back_ios_rounded,
                                  size: 18,
                                  color: Color(0xFFABAFE5),
                                ),
                                SizedBox(width: 8),
                                Text(
                                    'Back',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFABAFE5),
                                    fontWeight: FontWeight.w400
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    : const SizedBox(),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        fontFamily: 'Bebas',
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
                InkResponse(
                  child: const Icon(
                    Icons.settings,
                    size: 19,
                  ),
                  onTap: () => navToSettings(context),
                )
              ],
            ),
          ),
          Expanded(
              child: content
          )
        ],
    );
    //
  }
}
