import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerItem extends StatelessWidget {
  const TimePickerItem({Key? key, required this.isBooked, required this.date})
      : super(key: key);

  final bool isBooked;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          !isBooked ? '' : 'Забронировано',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondaryContainer,
              onSurface: const Color(0xFF0F0F1D),
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          onPressed:  isBooked ? null : (){
            print('Confim');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.access_time,
                size: 20,
                color: isBooked? const Color(0xFF58597B) :Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 10),
              Text(
                date.toString(),
                style: TextStyle(
                    color: isBooked? const Color(0xFF58597B) :Theme.of(context).colorScheme.secondary,
                    fontSize: 16
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}