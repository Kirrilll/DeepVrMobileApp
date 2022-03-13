import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPageTitle extends StatelessWidget {
  const BookingPageTitle({
    Key? key,
    required this.title,
    required this.step
  }) : super(key: key);

  final String title;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                step.toString(),
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
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
