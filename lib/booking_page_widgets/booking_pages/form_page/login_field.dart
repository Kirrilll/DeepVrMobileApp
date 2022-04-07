import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    Key? key,
    this.initialName,
    required this.setName
  }) : super(key: key);

   final String? initialName;
   final void Function(String?) setName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (value) => setName(value),
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
