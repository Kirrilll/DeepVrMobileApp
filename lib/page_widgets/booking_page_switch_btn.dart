import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookPageSwitchingBtn extends StatelessWidget {
  const BookPageSwitchingBtn({
    Key? key,
    required this.action,
    required this.text
  }) : super(key: key);

  final void Function() action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
          ),
          onPressed: () {
            action();
          },
          child: Text(text),
        ),
      ],
    );
  }
}
