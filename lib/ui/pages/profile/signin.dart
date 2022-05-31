import 'package:deepvr/ui/widgets/useful_widgets/default_button.dart';
import 'package:deepvr/ui/widgets/useful_widgets/default_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/view_models/identification_model.dart';
import '../../../enums/identification_routes.dart';
import '../../../locator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'ВХОД',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 46, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
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
                          onSaved: (value) => print(value)),
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
                    ],
                  )),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(
                        actTitle: "Войти", actionCallback: () => print('gsf')),
                  ],
                ),
              ),
              const SizedBox(height: 34),
              GestureDetector(
                onTap: () {
                  print('taped');
                  context.read<IdentificationModel>().navigateNamed(IdentificationRoutes.signUp);
                },
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
                            text: "У меня еще не аккаунта, хочу ",
                          ),
                          TextSpan(
                              text: "зарегистрироваться",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ))
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
