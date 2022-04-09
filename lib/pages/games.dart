import 'package:deepvr/booking_page_widgets/booking_page_switch_btn.dart';
import 'package:deepvr/pages/games_page/game_view.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class Games extends StatelessWidget {
  const Games({
    Key? key,
    required this.pageController
  }) : super(key: key);

  final PageController pageController;

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
              children: provider.games!.map((game) => GameView(
                  gameModel: game,
                 action:() =>  showDialog(
                     context: context,
                     builder: (context) => SimpleDialog(
                       title: Text(game.title),
                       children: [
                         BookPageSwitchingBtn(action: (){
                           //Вместо этого сделать в BookingModel контролирование всех выбранных объектов
                           var bookingModel = locator<BookingPageModel>();
                           var counterModel = locator<CounterViewModel>();
                           var gameTypeModel = locator<GameTypeViewModel>();
                           var gameModel = locator<GamesViewModel>();
                           gameTypeModel.selectType(game.gameType);
                           gameModel.setSelectedGame(game);
                           bookingModel.setViewModel(counterModel);
                           Navigator.of(context).pop();
                           pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                         },
                             text: 'Забронировать')
                       ],
                     )
                 )
              )).toList()
          )
          : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
