import 'package:deepvr/booking_page_widgets/booking_pages/form_page/login_field.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/phone_field.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/ui/shared/bottom_modal.dart';
import 'package:deepvr/ui/shared/custom_checkbox.dart';
import 'package:deepvr/ui/shared/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';

//TODO исправить Expanded в DefaultButton
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

  Widget buildSheet(BuildContext context) {
    return BottomModal(
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: InkResponse(
            onTap: () => print('close'),
            child: const Icon(
              Icons.clear,
              size: 30,
              color: Color(0xFF444656),
            ),
          ),
        ),
        const SizedBox(height: 42),
        Text(
          'Введите промокод',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.all(16),
            fillColor: Theme.of(context).colorScheme.secondaryContainer,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Много информации',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 11),
        ),
        const SizedBox(height: 63),
        SizedBox(
            height: 64,
            child: DefaultButton(
                actTitle: 'Применить',
                actionCallback: () => print('применить')))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formState,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LoginField(
              setName: (value) => bookingModel.booking.name = value,
              initialName: bookingModel.booking.name,
              formState: _formState,
            ),
            const SizedBox(height: 10),
            PhoneField(
              setPhone: (value) => bookingModel.booking.phone = value,
              initialValue: bookingModel.booking.phone,
              formState: _formState,
            ),
            const SizedBox(height: 24),
            Row(children: [
              const CustomCheckbox(),
              const SizedBox(width: 17),
              Expanded(
                child: RichText(
                    text: TextSpan(
                        text: 'Я принимаю условия пользовательского соглашения',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('tap');
                          },
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16,
                            letterSpacing: 0.34,
                            fontWeight: FontWeight.w400))),
              )
            ]),
            const SizedBox(height: 30),
            SizedBox(
              height: 170,
              child: TextField(
                maxLines: 100,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(16),
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    hintText: 'Комментарии'),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: buildSheet),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Color(0xFF444656)))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 10, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Промокод или сертификат',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF444656),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 10, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Баллы и бонусы',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.info,
                    size: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomCheckbox(),
                const SizedBox(width: 17),
                Text('Списать до 20% баллами',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.34))
              ],
            ),
            const SizedBox(height: 32)
          ],
        ),
      ),
    );
  }
}
