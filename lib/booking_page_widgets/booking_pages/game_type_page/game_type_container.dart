import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameTypeContainer extends StatelessWidget {
  const GameTypeContainer({
    Key? key,
    required this.gameTypes
  }) : super(key: key);

  final List<GameTypeModel> gameTypes;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: gameTypes.length,
        itemBuilder: (context, index) {
          return GameTypeCard(gameType: gameTypes[index],);
        },
        separatorBuilder: (_, index) => const SizedBox(height: 30),
    );
  }
}
