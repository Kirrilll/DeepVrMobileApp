import 'package:deepvr/locator.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerCounter extends StatelessWidget {
  const PlayerCounter({
    Key? key,
  }) : super(key: key);

  void Function()? increment(){
    final BookingModel _bookingModel = locator<BookingModel>();
    if(_bookingModel.guestCount! < _bookingModel.maxCount){
      return () => _bookingModel.guestCount = _bookingModel.guestCount!+1;
    }
    return null;
  }

  void Function()? decrement(){
    final BookingModel _bookingModel = locator<BookingModel>();
    if(_bookingModel.guestCount! > _bookingModel.minCount){
      return () => _bookingModel.guestCount = _bookingModel.guestCount!-1;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: const EdgeInsets.only(bottom: 48),
                // padding: const EdgeInsets.symmetric(vertical: 72),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Theme.of(context).colorScheme.secondaryContainer),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/realistic_vrglasses.png'),
                    Selector<BookingModel, int?>(
                      selector: (_, model) => model.guestCount,
                      builder: (_, guestCount, __) => guestCount!= null
                       ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: decrement(),
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
                              gradient: const LinearGradient(
                                  colors: [Color(0xFF36C0E7), Color(0xFF4B51EA)]),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                    guestCount.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: increment(),
                              icon: const Icon(
                                Icons.add,
                                size: 20,
                              ))
                        ],
                      )
                      : const SizedBox(),
                    ),
                  ],
                ),
    );
  }
}
