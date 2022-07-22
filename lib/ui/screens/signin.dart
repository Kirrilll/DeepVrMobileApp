import 'package:deepvr/data/entities/login.dart';
import 'package:deepvr/data/entities/registration.dart';
import 'package:deepvr/data/services/authentication_service.dart';
import 'package:deepvr/domain/view_models/login_model.dart';
import 'package:deepvr/ui/shared/default_button.dart';
import 'package:deepvr/usecases/helpers/validation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/enums/fetching_state.dart';
import '../../locator.dart';
import '../shared/default_formfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<LoginModel>(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Consumer<LoginModel>(
              builder: (context, model, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'ВХОД',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 46,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  Builder(
                      builder: (context) => model.state == FetchingState.error
                          ? Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Text(model.message!),
                            )
                          : const SizedBox()),
                  Form(
                      key: _formState,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          DefaultFormField(
                              controller: _phoneController,
                              initialValue: null,
                              textInputType: TextInputType.phone,
                              formState: _formState,
                              iconPath: 'assets/icons/phone.png',
                              hintText: '+7 (___) ___-__-__',
                              validator: (value) =>
                                  ValidationHelper.validatePhone(value!)),
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
                        ],
                      )),
                  const SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: model.state == FetchingState.loading
                        ? const Center(child: CircularProgressIndicator())
                        : DefaultButton(
                            actTitle: "Войти",
                            actionCallback: () {
                              if (_formState.currentState!.validate()) {
                                model.login(Login(
                                    phone: _phoneController.value.text,
                                    password:
                                        _passwordController.value.text));
                              }
                            }),
                  ),
                  const SizedBox(height: 34),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'auth/signUp');
                    },
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
        ),
      ),
    );
  }
}
