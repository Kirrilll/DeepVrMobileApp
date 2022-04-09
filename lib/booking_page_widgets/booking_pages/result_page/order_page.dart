import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../booking_page_switch_btn.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({
    Key? key,
    required this.viewModel
  }) : super(key: key);

  final BookingResultsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Бронирование'),
          const Spacer(),
          Text(viewModel.type),
          Text(viewModel.game),
          Text('Игроков: ${viewModel.guestCount}'),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 10),
              Text(viewModel.date)
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 10),
              Text(viewModel.time)
            ],
          ),
          const Spacer(),
          Text('Итого: ${viewModel.price}'),
          const Spacer(),
          BookPageSwitchingBtn(action: () => viewModel.order(),
              text: 'Забронировать')
        ]);
  }
}
