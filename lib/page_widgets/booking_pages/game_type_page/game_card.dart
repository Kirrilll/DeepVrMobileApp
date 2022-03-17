import 'package:deepvr/models/game_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameTypeCard extends StatelessWidget {
  const GameTypeCard({
    Key? key,
    required this.gameType
  }) : super(key: key);

  final GameType gameType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(36, 40, 21, 38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.secondaryContainer
      ),
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
                  gameType.minPlayers.toString() + '-' + gameType.maxPlayers.toString(),
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white
                  ),
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
                gameType.duration.toString(),
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
