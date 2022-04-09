import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Successful extends StatelessWidget {
  const Successful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Игра предварительно забронирована!'),
      ],
    );
  }
}
