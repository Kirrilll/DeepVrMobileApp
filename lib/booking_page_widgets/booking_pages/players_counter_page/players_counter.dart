
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PlayerCounter extends StatelessWidget {
  const PlayerCounter({Key? key,}) : super(key: key);

  void increment(Booking booking, BookingModel model){
    if(booking.guestCount! < (booking.selectedGame?.guestMax ?? booking.selectedGame!.gameType.guestMax) ){
      model.updateBooking(
          Booking(
            booking.selectedType,
            booking.selectedGame,
            booking.guestCount! + 1,
            null,
            null,
            booking.name,
            booking.name
          )
      );
    }
  }

  void decrement(Booking booking, BookingModel model){
    if(booking.guestCount! > (booking.selectedGame?.guestMin ?? booking.selectedGame!.gameType.guestMin)){
      model.updateBooking(
          Booking(
              booking.selectedType,
              booking.selectedGame,
              booking.guestCount! - 1,
              null,
              null,
              booking.name,
              booking.name
          )
      );
    }
  }

//Если это ListView обернуть в 2 Consumer(вепхний GamesViewModel) проверять на isFinished
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Consumer<BookingModel>(
              builder: (context, viewModel, child)  {
                return viewModel.booking.selectedGame != null ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          onPressed: () => decrement(viewModel.booking, viewModel),
                          icon: const Icon(
                            Icons.remove,
                            size: 20,
                          )
                      ),
                      Container(
                        width: 80,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme
                                .of(context)
                                .colorScheme
                                .secondaryContainer
                        ),
                        child: Center(
                          child: Text(
                            viewModel.booking.guestCount.toString(),
                            style: const TextStyle(
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),

                      IconButton(
                          onPressed: () => increment(viewModel.booking, viewModel),
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                          )
                      )
                    ],
                  ) : const Center(child: CircularProgressIndicator(),);
              }
      ),
    );
  }
}

