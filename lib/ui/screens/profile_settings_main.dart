import 'package:auto_route/auto_route.dart';
import 'package:deepvr/ui/templates/profile_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({
    Key? key,
  }) : super(key: key);


  void _navigateNamed(BuildContext context, String name) =>  context.router.pushNamed(name);
  void navToAbout(BuildContext context) => _navigateNamed(context,'about');
  void navToUpdate(BuildContext context) => _navigateNamed(context,'feedback');
  void navToFeedback(BuildContext context) => _navigateNamed(context,'update');


  @override
  Widget build(BuildContext context) {
    return  ProfileTemplate(
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
                    onPressed: () => navToUpdate(context),
                    title: 'Изменить профиль'
                ),
                Container(height: 1, color: const Color(0xFF444656)),
                SettingsButton(
                    onPressed: () => navToAbout(context),
                    title: 'О приложении '
                ),
                Container(height: 1, color: const Color(0xFF444656)),
                SettingsButton(
                    onPressed: () => navToFeedback(context),
                    title: 'Обратная связь'
                )
              ],
            )
          )
            ],
          ),
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
