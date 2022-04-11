import 'package:deepvr/booking_page_widgets/booking_pages/form_page/login_field.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/password.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../default_button.dart';

//Возможно аккуратное подключение к stream и подкидывание данных сюда
class OrderingForm extends StatefulWidget {
  const OrderingForm({Key? key}) : super(key: key);

  @override
  State<OrderingForm> createState() => _OrderingFormState();
}

class _OrderingFormState extends State<OrderingForm> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  var bookingModel = locator<BookingModel>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator<BookingFormViewModel>().setFormState(_formState);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LoginField(
              setName: (value) => bookingModel.booking.name = value,
              initialName:bookingModel.booking.name,
              formState: _formState,
          ),
          const SizedBox(height: 10),
          PasswordField(
              setPhone: (value) => bookingModel.booking.phone = value,
              initialValue: bookingModel.booking.phone,
              formState: _formState,
          ),
          // BookPageSwitchingBtn(text: 'Отправить', action: () {
          //   if(_formState.currentState!.validate()) {
          //     _formState.currentState?.save();
          //     FocusScope.of(context).unfocus();
          //   }
          // },)

        ],
      ),
    );
  }
}
