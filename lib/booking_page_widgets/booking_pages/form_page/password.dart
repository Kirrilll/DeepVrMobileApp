import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    this.initialValue,
    required this.setPhone
  }) : super(key: key);

  final String? initialValue;
  final void Function(String? value) setPhone;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value){
        const pattern = r'^\+?[78][-\(]?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$';
        var regExp =  RegExp(pattern);
        if(!regExp.hasMatch(value!)){
          return 'Неверно введет номер';
        }
        return null;
      },
      initialValue: initialValue,
      onSaved: (value) => setPhone(value),
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
