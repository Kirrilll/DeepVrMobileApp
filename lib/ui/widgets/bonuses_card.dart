import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BonusCard extends StatelessWidget {
  const BonusCard({
    Key? key,
    required this.count,
    required this.type
  }) : super(key: key);

  final int count;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      width: 230,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFF0F8FE),
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  type,
                style: const TextStyle(
                  color: Color(0xFF1F2653),
                  fontSize: 14
                ),
              ),
              IconButton(
                  iconSize: 14,
                  onPressed: () => print('info'),
                  icon: const Icon(
                      Icons.info,
                    color: Color(0xFFABAFE5),
                  )
              )
            ],
          ),
          Expanded(
            child: Text(
                count.toString(),
              style: const TextStyle(
                color: Color(0xFF1F2653),
                fontWeight: FontWeight.w700,
                fontSize: 46,
                letterSpacing: 1
              ),
            ),
          )
        ],
      ),
    );
  }
}
