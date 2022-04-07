import 'package:deepvr/booking_page_widgets/booking_pages/form_page/login_field.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/password.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../booking_page_switch_btn.dart';

//Возможно аккуратное подключение к stream и подкидывание данных сюда
class OrderingForm extends StatefulWidget {
  const OrderingForm({Key? key}) : super(key: key);

  @override
  State<OrderingForm> createState() => _OrderingFormState();
}

class _OrderingFormState extends State<OrderingForm> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  var formModel = locator<BookingFormViewModel>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LoginField(setName: (value) => formModel.name = value, initialName: formModel.name),
          const SizedBox(height: 10),
          PasswordField(setPhone: (value) => formModel.phoneNumber = value, initialValue: formModel.phoneNumber),
          // const SizedBox(height: 10),
          const Spacer(),
          BookPageSwitchingBtn(text: 'Отправить', action: () {
            if(_formState.currentState!.validate()) {
              _formState.currentState?.save();
              FocusScope.of(context).unfocus();
            }
          },)
          // const SizedBox(height: 20)
        ],
      ),
    );
  }
}
