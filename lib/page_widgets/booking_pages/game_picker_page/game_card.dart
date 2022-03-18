import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.path,
    required this.title,
    required this.id,
    required this.isActive,
    required this.setIsActive
  }) : super(key: key);

  final String path;
  final String title;
  final int id;
  final bool isActive;
  final void Function() setIsActive;

  get _buildBoxDecoration => (context) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15)
    );

    if(isActive){
      return boxDecoration.copyWith(
          border: Border.all(color: const Color(0XFF8556FF), width: 2),
          boxShadow: const [
            BoxShadow(
                color: Color(0xFF250F5d), blurRadius: 20, spreadRadius: 10),
          ]
      );
    }
    return boxDecoration;
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Image.network(path, fit: BoxFit.fill),
          decoration: _buildBoxDecoration(context),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
