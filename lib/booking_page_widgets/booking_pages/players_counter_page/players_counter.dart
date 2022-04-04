
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PlayerCounter extends StatelessWidget {
  const PlayerCounter({Key? key,}) : super(key: key);

//Если это ListView обернуть в 2 Consumer(вепхний GamesViewModel) проверять на isFinished
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Consumer<CounterViewModel>(
              builder: (context, viewModel, child)  {
                return viewModel.isAvailable ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          onPressed: () => viewModel.decrement(),
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
                            viewModel.guestCount.toString(),
                            style: const TextStyle(
                                fontSize: 24
                            ),
                          ),
                        ),
                      ),

                      IconButton(
                          onPressed: () => viewModel.increment(),
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

