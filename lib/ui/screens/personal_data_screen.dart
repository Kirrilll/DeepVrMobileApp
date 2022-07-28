import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/ui/widgets/personal_data_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookingStepTemplate(
        stepNumber: 6,
        content: PersonalDataForm(),
        stepTitle: 'Заполните данные о себе'
    );
  }
}
