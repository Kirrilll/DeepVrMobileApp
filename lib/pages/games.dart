import 'package:deepvr/booking_page_widgets/default_button.dart';
import 'package:deepvr/enums/routes.dart';
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/routes_model.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';
import '../widgets/games_page/game_view.dart';

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
              children: provider.games!.map((game) => GameView(
                  gameModel: game,
                 action:() =>  showDialog(
                     context: context,
                     builder: (context) => SimpleDialog(
                       title: Text(game.title),
                       children: [
                         DefaultButton(action: () => (){
                           var bookingModel = locator<BookingModel>();
                           bookingModel.init();
                           bookingModel.updateBooking(
                               Booking.copyWith(
                                   bookingModel.booking,
                                   selectedType: game.gameType,
                                   selectedGame: game,
                                    guestCount: game.guestMin ?? game.gameType.guestMin
                               )
                           );
                           bookingModel.setViewModel(locator<CounterViewModel>());
                           Navigator.of(context).pop();
                           locator<RoutesModel>().navigateToNamed(Routes.booking);
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
