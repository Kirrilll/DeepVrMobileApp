import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../ui/widgets/selectable_item.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.gameModel,
    required this.action
  }) : super(key: key);

  final GameModel gameModel;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingModel>(
      builder: (context, viewModel, child) => GestureDetector(
        onTap: action,
        child: SelectableItem(
          isSelected: viewModel.booking.selectedGame?.id == gameModel.id,
          item: Container(
            clipBehavior: Clip.hardEdge,
            height: 216,
            width: 162,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  gameModel.logo == null
                      ? 'https://srt.vrbook.creatrix-digital.ru/storage/' +
                          gameModel.gameType.image!
                      : 'https://srt.vrbook.creatrix-digital.ru/storage/' +
                          gameModel.logo!,
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child:  Text(
                        gameModel.title.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: -0.41
                      ),
                    ),
                  ),
                )
              ],
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ),
    );
  }
}
