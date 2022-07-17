import 'package:deepvr/ui/widgets/game_card.dart';
import 'package:deepvr/data/entities/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../locator.dart';
import '../../domain/models/booking.dart';

class GamesContainer extends StatefulWidget {
  const GamesContainer(
      {Key? key, required this.games, required this.action, this.selectedId})
      : super(key: key);

  final List<Game> games;
  final void Function(Game game) action;
  final int? selectedId;

  @override
  _GamesContainerState createState() => _GamesContainerState();
}

class _GamesContainerState extends State<GamesContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          int currIndex = index * 2;
          var isExist = currIndex + 1 != widget.games.length;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GameCard(
                  gameModel: widget.games[currIndex],
                  action: () => widget.action(widget.games[currIndex]),
                  isSelected: widget.games[currIndex].id == widget.selectedId,
              ),
              isExist
                  ? GameCard(
                      gameModel: widget.games[currIndex + 1],
                      action: () => widget.action(widget.games[currIndex + 1]),
                      isSelected: widget.games[currIndex+1].id == widget.selectedId,
              )
                  : const SizedBox()
            ],
          );
        },
        separatorBuilder: (_, index) => const SizedBox(height: 20),
        itemCount: (widget.games.length / 2).round());
  }
}
