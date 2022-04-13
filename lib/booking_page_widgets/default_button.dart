import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.action, required this.text})
      : super(key: key);

  //Прокидывать сюда controller, создать enum buttonType(next, back, confirm)

  final Function()? Function() action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12,
                  color: Colors.black,
                  offset: Offset(-4, -4),
                ),
              ],
              gradient: const LinearGradient(
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
            onSurface: Theme.of(context).colorScheme.onSurface,
            padding: const EdgeInsets.all(16.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
          ),
          onPressed: action(),
          child: Text(text, softWrap: false),
        ),
      ],
    );
  }
}
