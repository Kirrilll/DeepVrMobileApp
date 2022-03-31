import 'package:deepvr/providers/booking_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PlayerCounter extends StatelessWidget {
  const PlayerCounter({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var booking = Provider.of<BookingProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
              onPressed: () => booking.decrement(),
              icon: const Icon(
                Icons.remove,
                size: 20,
              )
          ),
          Container(
            width: 80,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondaryContainer
            ),
            child: Center(
              child: Text(
                booking.guestCount.toString(),
                style: const TextStyle(
                    fontSize: 24
                ),
              ),
            ),
          ),

          IconButton(
              onPressed: () => booking.increment(),
              icon: const Icon(
                Icons.add,
                size: 20,
              )
          )
        ],
      ),
    );
  }
}

