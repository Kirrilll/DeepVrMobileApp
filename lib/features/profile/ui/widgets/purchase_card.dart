import 'package:deepvr/domain/models/purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PurchaseCard extends StatelessWidget {
  const PurchaseCard({
    Key? key,
    required this.purchase
  }) : super(key: key);

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 '№${purchase.id}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFAFAFC)
                  ),
                ),
                Text(
                    '${purchase.price} ₽',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFAFAFC)
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                      '${purchase.guestCount} чел. | ${purchase.game} | ${purchase.gameType}',
                    style: const TextStyle(
                      color: Color(0xFFABAFE5),
                      fontSize: 12
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                Text(
                    'от ${purchase.getDate()}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFAFAFC)
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}
