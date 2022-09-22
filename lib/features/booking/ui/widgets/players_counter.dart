import 'package:deepvr/core/di/locator.dart';
import 'package:deepvr/features/booking/domain/view_models/guest_count_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerCounter extends StatelessWidget {
  const PlayerCounter({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<GuestModel>(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 56),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Theme.of(context).colorScheme.secondaryContainer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/realistic_vrglasses.png'),
                  Consumer<GuestModel>(
                    builder: (_, model, __) => Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: model.isMin ? null : model.decrement,
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.remove,
                                  )),
                              Container(
                                width: 95,
                                height: 52,
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFF36C0E7),
                                    Color(0xFF4B51EA)
                                  ]),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      model.guestCount.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: model.isMax ? null : model.increment,
                                  icon: const Icon(
                                    Icons.add,
                                    size: 20,
                                  ))
                            ],
                          )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
