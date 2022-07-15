
import 'package:deepvr/models/booking.dart';
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
    return Consumer<BookingModel>(
            builder: (context, viewModel, child)  {
              if (viewModel.booking.selectedGame != null) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 48),
                  // padding: const EdgeInsets.symmetric(vertical: 72),
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Theme.of(context).colorScheme.secondaryContainer
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/realistic_vrglasses.png'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () => decrement(viewModel.booking, viewModel),
                              padding: const EdgeInsets.all(0),
                              iconSize: 20,
                              icon: const Icon(
                                Icons.remove,
                              )
                          ),
                          Container(
                            width: 95,
                            height: 52,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(colors: [Color(0xFF36C0E7), Color(0xFF4B51EA)]),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(15),
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
                          ),

                          IconButton(
                              onPressed: () => increment(viewModel.booking, viewModel),
                              icon: const Icon(
                                Icons.add,
                                size: 20,
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            }
    );
  }
}

