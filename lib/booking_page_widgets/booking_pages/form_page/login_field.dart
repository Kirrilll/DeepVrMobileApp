import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    Key? key,
    this.initialName,
    required this.setName,
    required this.formState

  }) : super(key: key);

   final String? initialName;
   final void Function(String?) setName;
   final GlobalKey<FormState> formState;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      keyboardType: TextInputType.text,
      onSaved: (value) {
        var bookingModel = locator<BookingModel>();
        bookingModel.updateBooking(Booking.copyWith(bookingModel.booking, name: value));
      },
      initialValue: initialName,
      // validator: (value){
      //   const pattern = r'/^[а-яё]{30}|[a-z]{30}$/iu';
      //   var regExp = RegExp(pattern);
      //   if(!regExp.hasMatch(value!)){
      //     return 'Неверное имя';
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          prefixIcon:  const Icon(Icons.account_circle),
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none
          ),
          hintText: 'Введите ваше имя'
      ),
    );
  }
}
