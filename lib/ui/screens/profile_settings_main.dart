import 'package:deepvr/ui/templates/base_profile_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({
    Key? key,
    required this.rootContext
  }) : super(key: key);

  final BuildContext rootContext;

  @override
  Widget build(BuildContext context) {
    return BaseProfileTemplate(
      navigatorContext: rootContext,
        content: Column(
          children: [
            const SizedBox(height: 42),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFF1F2032)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettingsButton(
                  onPressed: () => Navigator.pushNamed(context, 'profile/settings/update'),
                  title: 'Изменить профиль'
              ),
              Container(height: 1, color: const Color(0xFF444656)),
              SettingsButton(
                  onPressed: () => Navigator.pushNamed(context, 'profile/settings/about'),
                  title: 'О приложении '
              ),
              Container(height: 1, color: const Color(0xFF444656)),
              SettingsButton(
                  onPressed: () => Navigator.pushNamed(context, 'profile/settings/feedback'),
                  title: 'Обратная связь'
              )
            ],
          )
        )
          ],
        )
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.onPressed,
    required this.title
  }) : super(key: key);

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF1F2032),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.41
              ),
            ),
            const Icon(
                Icons.arrow_forward_ios,
              size: 18,
              color: Color(0xFF444656),
            )
          ],
        )
    );
  }
}
