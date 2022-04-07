import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Объединить это с GameCard
class GameView extends StatelessWidget {
  const GameView(
      {Key? key,
        required this.gameModel,
      })
      : super(key: key);

  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:() => print('content'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  gameModel.logo  == null
                      ? 'https://srt.vrbook.creatrix-digital.ru/storage/' + gameModel.gameType.image!
                      : 'https://srt.vrbook.creatrix-digital.ru/storage/' + gameModel.logo!,
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : const Center(child:  CircularProgressIndicator());
                  },
                ),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                gameModel.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
  }
}