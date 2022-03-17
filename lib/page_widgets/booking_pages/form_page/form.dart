import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderingForm extends StatefulWidget {
  const OrderingForm({Key? key}) : super(key: key);

  @override
  State<OrderingForm> createState() => _OrderingFormState();
}

class _OrderingFormState extends State<OrderingForm> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

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
            TextFormField(
              keyboardType: TextInputType.text,
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
            const SizedBox(height: 10),
            // const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
