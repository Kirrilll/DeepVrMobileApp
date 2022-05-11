import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/games_container.dart';
import 'package:deepvr/enums/routes.dart';
import 'package:deepvr/models/game_model/game_model.dart';
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

import '../../locator.dart';
import '../widgets/default_button.dart';

class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  void Function(GameModel) _showGameProfile( BuildContext context) {
    return (game) => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(game.title),
              children: [
                DefaultButton(
                    actionCallback: () {
                      _selectGame(game);
                      Navigator.of(context).pop();
                      locator<RoutesModel>().navigateToNamed(Routes.booking);
                    },
                    actTitle: 'Забронировать')
              ],
            ));
  }

  void _selectGame(GameModel game) {
    var bookingModel = locator<BookingModel>();
    bookingModel.init();
    bookingModel.updateBooking(Booking.copyWith(bookingModel.booking,
        selectedType: game.gameType,
        selectedGame: game,
        guestCount: game.guestMin ?? game.gameType.guestMin));
    bookingModel.setViewModel(locator<CounterViewModel>());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MultiProvider(providers: [
        ChangeNotifierProvider.value(value: locator<GamesProvider>()),
        ChangeNotifierProvider.value(value: locator<BookingModel>())
      ],
        child: Consumer<GamesProvider>(
          builder: (context, viewModel, _) => viewModel.isLoaded
              ? GamesContainer(games: viewModel.games!, action: _showGameProfile(context))
              : const Center(child: CircularProgressIndicator()),
        ),
      )
    );
  }
}
