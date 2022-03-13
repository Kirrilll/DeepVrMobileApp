import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPageItem extends StatelessWidget {
  const BookingPageItem({
    Key? key,
    required this.stepNumber,
    required this.content,
    required this.stepTitle,
    required this.action
  }) : super(key: key);

  final Widget content;
  final int stepNumber;
  final String stepTitle;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 33),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //Ширина полоски с градиентом
                padding: const EdgeInsets.all(3),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(149, 46, 241, 1),
                      Color.fromRGBO(23, 196, 231, 1)
                    ])),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.background),
                  child: Center(
                    child: Text(
                      stepNumber.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  stepTitle,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Expanded(child: content),
          const SizedBox(height: 48),
          Stack(
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
                child: const Text('Далее'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
