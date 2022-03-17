import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PlayerCounter extends StatelessWidget {
  const PlayerCounter({
    Key? key,
    required this.count,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  final int count;
  final void Function() increment;
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
              onPressed: () => decrement(),
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
                count.toString(),
                style: const TextStyle(
                    fontSize: 24
                ),
              ),
            ),
          ),

          IconButton(
              onPressed: () => increment(),
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

