import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/ui/widgets/error_panel.dart';
import 'package:deepvr/features/authentication/data/entities/registration.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/authentication/domain/view_models/registration_model.dart';
import 'package:deepvr/core/usecases/helpers/validation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../../core/domain/locator.dart';
import '../../../../core/ui/shared/default_button.dart';
import '../../../../core/ui/shared/default_formfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _viewModel = locator<RegistrationModel>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  void navigateToSignIn(BuildContext context) => context.router.pop();
  void navigateToError(BuildContext context, String message) =>
      showDialog(context: context, builder: (_) => ErrorPanel(message: message));

  @override
  void initState() {
    _viewModel.addListener(() {
      if(_viewModel.signUpStatus == FetchingState.error){
        navigateToError(context, _viewModel.message);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
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
                  // Builder(builder: (context){
                  //   if(model.signUpStatus == FetchingState.error){
                  //     return Container(
                  //       margin: const EdgeInsets.only(bottom: 20),
                  //       child: const Text('Ошибка'),
                  //     );
                  //   }
                  //   return const SizedBox();
                  // }),
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
                    child: model.signUpStatus == FetchingState.loading
                        ? const Center(child: CircularProgressIndicator())
                        : DefaultButton(
                            actTitle: "Зарегестрироваться",
                            actionCallback: () {
                              model.signUp(Registration(
                                phone: _phoneController.value.text,
                                password: _passwordController.value.text,
                                passwordRepeat: _repeatPasswordController.value.text,
                                email: _mailController.value.text
                              ), _loginController.value.text);
                            },
                          ),
                  ),
                  const SizedBox(height: 26),
                  GestureDetector(
                    onTap: () => navigateToSignIn(context),
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
