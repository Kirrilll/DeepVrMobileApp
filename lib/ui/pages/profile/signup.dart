import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../domain/view_models/identification_model.dart';
import '../../../enums/identification_routes.dart';
import '../../../locator.dart';
import '../../widgets/useful_widgets/default_button.dart';
import '../../widgets/useful_widgets/default_formfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'РЕГИСТРАЦИЯ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 46, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultFormField(
                        initialValue: null,
                        formState: _formState,
                        onChange: (value) => print(value),
                        iconPath: 'assets/icons/person.png',
                        hintText: 'Введите ваше имя',
                        onSaved: (value) => print(value)),
                    const SizedBox(height: 10),
                    DefaultFormField(
                        initialValue: null,
                        textInputType: TextInputType.phone,
                        formState: _formState,
                        onChange: (value) => print(value),
                        iconPath: 'assets/icons/phone.png',
                        hintText: '+7 (___) ___-__-__',
                        validator: (value) {
                          const pattern =
                              r'^\+?[78][-\(]?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$';
                          var regExp = RegExp(pattern);
                          if (!regExp.hasMatch(value!)) {
                            return 'Неверно введет номер';
                          }
                          return null;
                        },
                        onSaved: (value) => print(value)
                    ),
                    const SizedBox(height: 10),
                    DefaultFormField(
                      initialValue: null,
                      formState: _formState,
                      onChange: (value) => print(value),
                      iconPath: 'assets/icons/password.png',
                      hintText: 'Введите пароль',
                      onSaved: (value) => print(value),
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    DefaultFormField(
                      initialValue: null,
                      formState: _formState,
                      onChange: (value) => print(value),
                      iconPath: 'assets/icons/password.png',
                      hintText: 'Повторите пароль',
                      onSaved: (value) => print(value),
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(actTitle: "Зарегестрироваться", actionCallback: () => print('gsf')),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              GestureDetector(
                onTap: () => context.read<IdentificationModel>().pop(),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        style:  TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.34,
                            color: Color(0xFFABAFE5),
                            fontFamily: 'Gilroy'),
                        children: [
                          TextSpan(
                            text: "У меня уже есть аккаунт. ",
                          ),
                          TextSpan(
                              text: "Войти",
                              style:  TextStyle(
                                decoration: TextDecoration.underline,
                              ))
                        ])
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
