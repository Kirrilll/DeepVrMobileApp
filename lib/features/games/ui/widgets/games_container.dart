import 'package:deepvr/features/games/ui/widgets/game_card.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/domain/locator.dart';
import '../../../../domain/models/booking.dart';

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
    return Align(
      alignment: Alignment.topCenter,
    //   child: SingleChildScrollView(
    //     child: Wrap(
    //       spacing: 20,
    //       runSpacing: 20,
    //       runAlignment: WrapAlignment.center,
    //       crossAxisAlignment: WrapCrossAlignment.center,
    //       children: widget.games
    //           .map((game) => SizedBox(
    //                 height: 216,
    //                 width: 162,
    //                 child: GameCard(
    //                     gameModel: game,
    //                     isSelected: game.id == widget.selectedId,
    //                     action: () => widget.action(game)),
    //               ))
    //           .toList(),
    //     ),
    //   ),
    // );
     child: GridView.builder(
        itemCount: widget.games.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 162,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.75
        ),
        itemBuilder: (_, index) => GameCard(
          gameModel: widget.games[index],
          action: () => widget.action(widget.games[index]),
          isSelected: widget.games[index].id == widget.selectedId,
        )
    ));
  }
}
