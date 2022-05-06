import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/widgets/selectable_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.gameModel,
  }) : super(key: key);

  final GameModel gameModel;

  get _buildBoxDecoration => (context, isActive) {
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
    return Consumer<BookingModel>(
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () {
          //Записываем вместе с типом
          viewModel.updateBooking(Booking.copyWith(viewModel.booking,
              selectedGame: gameModel,
              selectedType: gameModel.gameType,
              guestCount: gameModel.guestMin ?? gameModel.gameType.guestMin));
        },
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
