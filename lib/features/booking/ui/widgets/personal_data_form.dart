import 'package:deepvr/core/ui/shared/bottom_modal.dart';
import 'package:deepvr/core/ui/shared/default_button.dart';
import 'package:deepvr/features/booking/domain/view_models/personal_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/locator.dart';
import '../../../../core/usecases/helpers/validation_helper.dart';
import '../../../../core/ui/shared/custom_checkbox.dart';

//TODO пофиксить штуку с формами

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({
    Key? key,

  }) : super(key: key);

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {

  final _personalDataModel = locator<PersonalDataModel>();
  late final  _nameController = _personalDataModel.nameController;
  late final _phoneController = _personalDataModel.phoneController;
  late final _commentController = _personalDataModel.commentController;
  late final _setAgree = _personalDataModel.setAgree;

  Widget buildSheet(BuildContext context) {
    return BottomModal(
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: InkResponse(
            onTap: () => Navigator.pop(context),
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
                actionCallback: () => print('применить')
            )
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<PersonalDataModel>(),
      child:  SingleChildScrollView(
            child:  Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                    decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                        prefixIcon: ImageIcon(
                          const AssetImage('assets/icons/person.png'),
                          size: 24,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
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
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) => ValidationHelper.validatePhone(value ?? ''),
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.all(16),
                            prefixIcon:  ImageIcon(
                              const AssetImage('assets/icons/phone.png'),
                              size: 24,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            fillColor: Theme.of(context).colorScheme.secondaryContainer,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                            hintText: '+7 (___) ___-__-__'
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(children: [
                         Selector<PersonalDataModel, bool>(
                           selector: (_, model) => model.isAgree,
                           builder: (_, isAgree, __) => CustomCheckbox(
                                isSelected:  isAgree,
                                action: _setAgree
                            ),
                         ),
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
                          controller: _commentController,
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
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: buildSheet
                        ),
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
            ),
      );
  }
}
