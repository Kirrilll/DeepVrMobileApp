import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfileStatusCard extends StatelessWidget {
  const ProfileStatusCard.short(
      {Key? key,
      required this.title,
      required this.imagePath,
      this.isShort = true,
      this.bonuses,
      this.isUsers})
      : super(key: key);

  const ProfileStatusCard.extended(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.bonuses,
      required this.isUsers,
      this.isShort = false})
      : super(key: key);

  final String title;
  final String imagePath;
  final String? bonuses;
  final bool isShort;
  final bool? isUsers;

  void navToStatuses(BuildContext context) => context.router.pushNamed('statuses');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 263,
      width: 197,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xFF1F2032)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
                letterSpacing: -0.41),
          ),
          const SizedBox(height: 8),
          Builder(
              builder: (context) => isShort
                  ? RichText(
                  text:  TextSpan(
                      text: 'Все статусы',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => navToStatuses(context),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFFABAFE5),
                        decoration: TextDecoration.underline
                      )
                  )
              )
                  : Text(bonuses!)),
          const SizedBox(height: 8),
          Builder(
              builder: (context) => isUsers ?? false
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Color(0xFF1CA93A)),
                      child: const Text('Ваш статус'),
                    )
                  : const SizedBox())
        ],
      ),
    );
  }
}
