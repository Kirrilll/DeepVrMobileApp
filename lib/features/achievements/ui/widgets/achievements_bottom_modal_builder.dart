import 'package:deepvr/features/achievements/data/entities/achievement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/ui/shared/default_button.dart';

typedef BodyBuilder =  SliverChildDelegate Function(BuildContext, double);
typedef HeaderBuilder = Widget Function(BuildContext, double);

class AchievementsBottomModalBuilder{

  static VoidCallback _buildButtonAction(BuildContext context) => () {
    Clipboard.setData(const ClipboardData(text: 'Промокоды'));
    Navigator.of(context).pop();
  };

  static List<Widget> buildBody(BuildContext context, Achievement achievement) =>  [
          Text(
            achievement.title,
            style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 181,
            width: 181,
            child: Center(child: Image.network(achievement.imgPath)),
          ),
          const SizedBox(height: 32),
          const Text('Получение',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white)),
          const SizedBox(height: 8),
          Text(
            achievement.description,
            style: const TextStyle(
              color: Color(0xFFABAFE5),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 32),
          const Text('Награда',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white)),
          const SizedBox(height: 8),
          Text(
            achievement.prize,
            style: const TextStyle(
              color: Color(0xFFABAFE5),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 20),
          DefaultButton(
              actTitle: 'Скопировать промокод',
              actionCallback: _buildButtonAction(context)
          )
        ];
}