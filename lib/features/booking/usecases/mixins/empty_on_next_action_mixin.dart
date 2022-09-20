import 'package:deepvr/features/booking/usecases/interfaces/i_booking_model.dart';

mixin EmptyOnNextMixin on IBookingModel {
  @override
  void onNext() {return;}
}