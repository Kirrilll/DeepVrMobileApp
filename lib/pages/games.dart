import 'package:deepvr/pages/games_page/game_view.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ChangeNotifierProvider.value(
        value: locator<GamesProvider>(),
        child: Consumer<GamesProvider>(
          builder:(context, provider, _) => provider.isLoaded
            ? GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 315
              ),
              children: provider.games!.map((game) => GameView(gameModel: game)).toList()
          )
          : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
