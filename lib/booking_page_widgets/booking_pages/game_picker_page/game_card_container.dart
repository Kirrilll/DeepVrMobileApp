import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_card.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameCardContainer extends StatefulWidget {
  const GameCardContainer({
    Key? key,
    required this.games
  }) : super(key: key);

  final List<GameModel> games;

  @override
  _GameCardContainerState createState() => _GameCardContainerState();
}

class _GameCardContainerState extends State<GameCardContainer> {

  @override
  Widget build(BuildContext context) {
    // return GridView(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 15,
    //     crossAxisSpacing: 15,
    //     //mainAxisExtent: 315
    //   ),
    //   children: widget.games
    //       .map((game) => GameCard(gameModel: game))
    //       .toList()
    // );
    return ListView.separated(
        itemBuilder: (context, index){
          int currIndex = index * 2;
          var isExist = currIndex +1 != widget.games.length;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GameCard(gameModel: widget.games[currIndex]),
              isExist? GameCard(gameModel: widget.games[currIndex+1]): const SizedBox()
            ],
          );
        },
        separatorBuilder: (_, index) => const SizedBox(height: 20),
        itemCount: (widget.games.length / 2).round()
    );
  }
}
