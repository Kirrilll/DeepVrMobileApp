import 'package:flutter/material.dart';

class AchievementsSwitcherButton extends StatelessWidget {
  const AchievementsSwitcherButton(
      {Key? key, required this.isAllAchievements, required this.switchScreen})
      : super(key: key);

  final bool isAllAchievements;
  final VoidCallback switchScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: switchScreen,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFF1F2032)),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Expanded(child: _SwitcherButton(isActive: !isAllAchievements, text: 'Мои достижения')),
            Expanded(child: _SwitcherButton(text: 'Все достижения', isActive: isAllAchievements))
          ],
        ),
      ),
    );
  }
}

class _SwitcherButton extends StatelessWidget {
  const _SwitcherButton({Key? key, required this.text, required this.isActive})
      : super(key: key);

  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 13),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(11)),
                gradient: LinearGradient(
                    colors: [Color(0xFF36C0E7), Color(0xFF4B51EA)])),
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
          )
        : Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFFABAFE5)),
          );
  }
}
