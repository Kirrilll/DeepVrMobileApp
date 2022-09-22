import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:deepvr/features/booking/ui/templates/booking_step_template.dart';
import 'package:deepvr/features/games/ui/widgets/games_container.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/locator.dart';

class GameCardPage extends StatelessWidget {
  const GameCardPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BookingStepTemplate(
        stepNumber: 2,
        content: ChangeNotifierProvider.value(
          value: locator<BookingGamesModel>(),
          child: Consumer<BookingGamesModel>(
              builder: (_, model, __) => StreamBuilder<List<Game>>(
                  stream: model.games,
                  builder: (_, snapshot) {
                    if(snapshot.hasData){
                      return GamesContainer(
                        games: snapshot.requireData,
                        action: (game) => model.selectGame(game),
                        selectedId: model.selectedGame?.id,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }
              )
            ),
        ),
        stepTitle: 'Выберите VR-игру',
      );
  }
}
