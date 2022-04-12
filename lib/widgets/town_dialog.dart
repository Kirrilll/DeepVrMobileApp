import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TownDialog extends StatelessWidget {
  const TownDialog({Key? key}) : super(key: key);

  final List<String> points = const [
    'Саратов',
    'Казань',
    'Тюмень',
    'Челябинск',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF191A29)
        ),
        padding: const EdgeInsets.fromLTRB(30, 19, 30, 30),
        child: ListView.separated(
          itemCount: points.length,
          itemBuilder: (context, index) => TownDialogItem(town: points[index], country: points[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}


class TownDialogItem extends StatelessWidget {
  const TownDialogItem({
    Key? key,
    required this.country,
    required this.town
  }) : super(key: key);

  final String town;
  final String country;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.pop(context),
        child: Row(
          children: [
            Text(
              town,
              style:  TextStyle(
                letterSpacing: 0.3,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(width: 5),
            Text(
                '($country)',
              style: TextStyle(
                letterSpacing: 0.3,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        )
    );
  }
}
