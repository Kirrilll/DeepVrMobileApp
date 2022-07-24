import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/booking_information.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/ui/screens/booking_information_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO нормально хэндлить ошибку
//TODO вызывать метод getBooking
class BookingResultScreen extends StatelessWidget {
  const BookingResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingModel>(
      builder: (_, model, __) => model.mayBook
          ? Builder(
            builder: (context) {
              switch(model.bookingStatus){
                case FetchingState.error:
                  return Center(child: Text(model.errorMessage!));
                case FetchingState.loading:
                  return const Center(child: CircularProgressIndicator());
                default:
                  return BookingInformationScreen(bookingInformation: model.bookingInformation);
              }
            }
          )
          : const SizedBox(),
    );
  }
}

class ResultRow extends StatelessWidget {
  const ResultRow({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          text,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
