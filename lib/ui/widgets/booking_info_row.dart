import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingInfoRow extends StatelessWidget {
  const BookingInfoRow(
      {Key? key,
        required this.payload,
        required this.isImage,
        required this.value
      }) : super(key: key);

  factory BookingInfoRow.image({required String path, required String value}) => BookingInfoRow(payload: path, isImage: true, value: value);
  factory BookingInfoRow.text({required String text, required String value}) => BookingInfoRow(payload: text, isImage: false, value: value);

  final String payload;
  final bool isImage;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 91,
          alignment: Alignment.centerLeft,
          child: isImage
              ? ImageIcon(
                  AssetImage(payload),
                  color: const Color(0xFFABAFE5),
                  size: 24,
                )
              : Text(payload,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFFABAFE5)
                  )
                ),
        ),
        Expanded(
            child: Text(
                value,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                )
            )
        )
      ],
    );
  }
}
