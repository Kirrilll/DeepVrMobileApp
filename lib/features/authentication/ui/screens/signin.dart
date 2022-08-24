import 'package:auto_route/auto_route.dart';
import 'package:deepvr/features/authentication/data/entities/login.dart';
import 'package:deepvr/features/authentication/domain/view_models/login_model.dart';
import 'package:deepvr/core/ui/shared/default_button.dart';
import 'package:deepvr/core/usecases/helpers/validation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/usecases/special_types/fetching_state.dart';
import '../../../../core/domain/locator.dart';
import '../../../../core/ui/shared/default_formfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void navigateToRegistration(BuildContext context) => context.router.pushNamed('signup');

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
                            validator: (value) => ValidationHelper.validatePassword(value!),
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
                                    password: _passwordController.value.text));
                              }
                            }),
                  ),
                  const SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => navigateToRegistration(context),
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
