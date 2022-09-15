import 'package:deepvr/features/booking/domain/interfaces/i_booking_model.dart';

mixin EmptyOnNextMixin on IBookingModel {
  @override
  void onNext() {return;}
}