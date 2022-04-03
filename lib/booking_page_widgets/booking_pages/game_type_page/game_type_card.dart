import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/providers/booking_provider.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class GameTypeCard extends StatelessWidget {
  const GameTypeCard(
      {Key? key,
        required this.gameType,
      }) : super(key: key);

  final GameTypeModel gameType;

  get _buildBoxDecoration => (context, isActive) {
        BoxDecoration boxDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondaryContainer);

        if (isActive) {
          return boxDecoration.copyWith(
              border: Border.all(color: const Color(0XFF8556FF), width: 2),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFF250F5d), blurRadius: 20, spreadRadius: 10),
              ]);
        }
        return boxDecoration;
      };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => locator<GameTypeViewModel>().setSelectedType(gameType),
      child: Container(
        padding: const EdgeInsets.fromLTRB(36, 40, 21, 38),
        decoration: _buildBoxDecoration(context, locator<GameTypeViewModel>().selectedType?.id == gameType.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              gameType.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                Icon(
                  Icons.videogame_asset,
                  size: 25,
                  color: Colors.cyan.shade700,
                ),
                const SizedBox(width: 10),
                Text(
                  gameType.guestMin.toString() +
                      '-' +
                      gameType.guestMax.toString(),
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.cyan.shade700,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  gameType.timeDuration.toString(),
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
