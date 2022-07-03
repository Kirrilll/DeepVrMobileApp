import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookingStepTemplate(
        stepNumber: 6,
        content: OrderingForm(),
        stepTitle: 'Заполните данные о себе'
    );
  }
}
