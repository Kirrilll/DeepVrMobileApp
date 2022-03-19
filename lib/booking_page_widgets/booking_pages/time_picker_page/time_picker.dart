import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 80,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16
        ),
        children: const [
          TimePickerItem(isBooked: true, date: '11:00'),
          TimePickerItem(isBooked: false, date: '12:00'),
          TimePickerItem(isBooked: false, date: '13:00'),
          TimePickerItem(isBooked: false, date: '14:00'),
          TimePickerItem(isBooked: false, date: '14:40'),
          TimePickerItem(isBooked: true, date: '15:00'),
          TimePickerItem(isBooked: true, date: '15:50'),
        ],
    );
  }
}

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
