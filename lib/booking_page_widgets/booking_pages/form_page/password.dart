import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../models/refactor/booking.dart';
import '../../../providers/refactor/booking_model.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    this.initialValue,
    required this.setPhone,
    required this.formState
  }) : super(key: key);

  final String? initialValue;
  final void Function(String? value) setPhone;
  final GlobalKey<FormState> formState;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (_){
        if(formState.currentState!.validate()){
          formState.currentState!.save();
        }
        else{
          var bookingModel =  locator<BookingModel>();
          bookingModel.updateBooking(Booking(
              bookingModel.booking.selectedType,
              bookingModel.booking.selectedGame,
              bookingModel.booking.guestCount,
              bookingModel.booking.selectedDate,
              bookingModel.booking.selectedTime,
              null,
              null
          ));
        }
      },
      validator: (value){
        const pattern = r'^\+?[78][-\(]?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$';
        var regExp =  RegExp(pattern);
        if(!regExp.hasMatch(value!)){
          return 'Неверно введет номер';
        }
        return null;
      },
      initialValue: initialValue,
      onSaved: (value) {
        var bookingModel = locator<BookingModel>();
        bookingModel.updateBooking(Booking.copyWith(bookingModel.booking, phone: value));
      },
      decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          prefixIcon:  const Icon(Icons.phone),
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none
          ),
          hintText: '+7 (___) ___-__-__'
      ),
    );
  }
}
