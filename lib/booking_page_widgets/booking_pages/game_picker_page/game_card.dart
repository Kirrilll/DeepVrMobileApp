import 'package:deepvr/models/game_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard(
      {Key? key,
      required this.gameModel,
      required this.isActive,
      required this.setIsActive})
      : super(key: key);

  final GameModel gameModel;
  final bool isActive;
  final void Function() setIsActive;

  get _buildBoxDecoration => (context) {
        BoxDecoration boxDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(15),
        );

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
    return Column(
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
              fit: BoxFit.contain,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : const CircularProgressIndicator();
              },
            ),
            decoration: _buildBoxDecoration(context),
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
    );
  }
}
