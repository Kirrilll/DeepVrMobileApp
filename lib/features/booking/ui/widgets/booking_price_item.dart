import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPriceItem extends StatelessWidget {
  const BookingPriceItem({
    Key? key,
    required this.title,
    required this.price,
    this.isDiscount = false
  }) : super(key: key);

  final String title;
  final int? price;
  final bool isDiscount;

  factory BookingPriceItem.discount({ required title, required discount}) => BookingPriceItem(title: title, price: discount, isDiscount: true,);

  @override
  Widget build(BuildContext context) {
    return  price != null
         ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
              '$title:',
              style: const TextStyle(fontSize: 16, color: Color(0xFFABAFE5),),
            ),
            Text(
              '${isDiscount ? -price!: price} ₽',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        )
          : const SizedBox();
  }
}
