import 'package:deepvr/core/usecases/helpers/validation_helper.dart';
import 'package:deepvr/features/booking/usecases/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/usecases/updating_keys.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/locator.dart';
import '../../../../domain/models/booking.dart';
import '../../../authentication/domain/services/authentication_service.dart';
import '../services/booking_service.dart';

class PersonalDataModel with ChangeNotifier implements IBookingModel {
  final _formState = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _commentController = TextEditingController();
  final _authenticationService = locator<AuthenticationService>();
  final _bookingService = locator<BookingService>();
  bool _isAgree = false;

  PersonalDataModel() {
    initUserData();
    _authenticationService.addListener(initUserData);
    _bookingService.addListener(init);
    _nameController.addListener(notifyListeners);
    _phoneController.addListener(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _commentController.dispose();
    _phoneController.dispose();
  }

  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get commentController => _commentController;
  GlobalKey<FormState> get formState => _formState;
  bool get isAgree => _isAgree;

  void init(){
    initUserData();
    _commentController.text = '';
    _isAgree = false;
    notifyListeners();
  }

  void initUserData() {
    _nameController.text = _authenticationService.user.login ?? '';
    _phoneController.text = _authenticationService.user.phone ?? '';
  }

  void setAgree() {
    _isAgree = !_isAgree;
    notifyListeners();
  }

  @override
  bool isFinished() =>
      ValidationHelper.validatePhone(_phoneController.value.text) == null &&
      _nameController.text.isNotEmpty &&
      _isAgree;

  @override
  void onNext() {
    if (_bookingService.booking.name != _nameController.text ||
        _bookingService.booking.phone != _phoneController.text ||
        _bookingService.booking.comment != _commentController.text){
      _bookingService.updateBooking(
          _bookingService.booking.copyWith(
              name: _nameController.value.text,
              phone: _phoneController.value.text,
              comment: _commentController.value.text
          ), getUpdatingKey());
    }
  }

  @override
  Future<void> onNextAsync() async {}

  @override
  String getUpdatingKey() => personalDataKey;
}
