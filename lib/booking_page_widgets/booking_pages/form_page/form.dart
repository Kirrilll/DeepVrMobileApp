import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../booking_page_switch_btn.dart';

//TODO добавить валидацию, убирание клавиатуры после нажатия, отправка данных

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
          TextFormField(
            //keyboardType: TextInputType.,
            onSaved: (value) => formModel.name = value,
            initialValue: formModel.name,
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
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.phone,
            validator: (value){
              const pattern = r'^\+?[78][-\(]?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$';
              var regExp =  RegExp(pattern);
              if(!regExp.hasMatch(value!)){
                return 'Неверно введет номер';
              }
              return null;
            },
            initialValue: locator<BookingFormViewModel>().phoneNumber,
            onSaved: (value) => formModel.phoneNumber = value,
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
          ),
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
