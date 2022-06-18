import 'package:deepvr/data/entities/registration.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/registration_model.dart';
import 'package:deepvr/usecases/helpers/validation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../domain/view_models/identification_routing_model.dart';
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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<RegistrationModel>(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Consumer<RegistrationModel>(
              builder: (context, model, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'РЕГИСТРАЦИЯ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 46,
                        color: Colors.white),
                  ),
                  Builder(builder: (context){
                    if(model.signUpStatus == FetchingState.error){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: const Text('Ошибка'),
                      );
                    }
                    return const SizedBox();
                  }),
                  const SizedBox(height: 24),
                  Form(
                    key: _formState,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultFormField(
                            controller: _loginController,
                            initialValue: null,
                            formState: _formState,
                            iconPath: 'assets/icons/person.png',
                            hintText: 'Введите ваше имя'),
                        const SizedBox(height: 10),
                        DefaultFormField(
                            controller: _mailController,
                            initialValue: null,
                            textInputType: TextInputType.emailAddress,
                            formState: _formState,
                            iconPath: 'assets/icons/phone.png',
                            hintText: 'email@mail.com',
                            validator: (value) => ValidationHelper.validateEmail(value!)),
                        const SizedBox(height: 10,),
                        DefaultFormField(
                            controller: _phoneController,
                            initialValue: null,
                            textInputType: TextInputType.phone,
                            formState: _formState,
                            iconPath: 'assets/icons/phone.png',
                            hintText: '+7 (___) ___-__-__',
                            validator: (value) => ValidationHelper.validatePhone(value!)),
                        const SizedBox(height: 10),
                        DefaultFormField(
                          controller: _passwordController,
                          initialValue: null,
                          formState: _formState,
                          iconPath: 'assets/icons/password.png',
                          hintText: 'Введите пароль',
                          validator: (value) =>
                              ValidationHelper.validatePassword(value!),
                          isPassword: true,
                        ),
                        const SizedBox(height: 10),
                        DefaultFormField(
                          controller: _repeatPasswordController,
                          initialValue: null,
                          formState: _formState,
                          iconPath: 'assets/icons/password.png',
                          hintText: 'Повторите пароль',
                          validator: (value) {
                            if (value != _passwordController.value.text) {
                              return 'Не совпадает с паролем';
                            }
                            return null;
                          },
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
                        model.signUpStatus == FetchingState.loading
                            ? const CircularProgressIndicator()
                            : DefaultButton(
                                actTitle: "Зарегестрироваться",
                                actionCallback: () {
                                  model.signUp(Registration(
                                    phone: _phoneController.value.text,
                                    password: _passwordController.value.text,
                                    passwordRepeat: _repeatPasswordController.value.text,
                                    email: _mailController.value.text
                                  ));
                                },
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  GestureDetector(
                    onTap: () =>
                        context.read<IdentificationRoutingModel>().pop(),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            style: TextStyle(
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
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ))
                            ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
