import 'dart:async';

import 'package:deepvr/domain/view_models/base_booking_step_model.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/domain/models/booking_step.dart';
import 'package:deepvr/usecases/configurations/booking_step_config.dart';
import 'package:flutter/cupertino.dart';


/*
* Возможно isFinished вынести в единный интерфейс и в каждой моделе следить за этим
* присваивать в booking только после нажатия next
* также additionalFunc обустроить в next
* */
class BookingModel with ChangeNotifier{
  final List<BookingStep> _steps = bookingSteps;
  int _currPageIndex = 0;
  late bool _isFinished;

  Booking booking = Booking.initial();

  List<BookingStep> get steps => _steps;
  int get currStepIndex => _currPageIndex;
  bool get mayNext => steps[_currPageIndex].viewModel.isFinished() && _currPageIndex < _steps.length-1;
  bool get mayBack => _currPageIndex > 0;
  BaseBookingStepModel get stepModel => steps[_currPageIndex].viewModel;

  void initStepsModels(){
    for (var step in _steps) {
      step.viewModel.init(this);
    }
  }

  setCurrStepIndex(int index){
    if(index >= 0 && index <= _steps.length -1){
      _currPageIndex = index;
      notifyListeners();
    }
  }

  void next(){
    if(mayNext){
      stepModel.onNext();
      setCurrStepIndex(_currPageIndex+1);
    }
  }

  void back(){
    if(mayBack){
      setCurrStepIndex(_currPageIndex-1);
    }
  }

  
  setCurrStep(BookingStep step){
    final stepIndex = _steps.indexWhere((element) => element == step);
    setCurrStepIndex(stepIndex);
  }
  
  void updateBooking(Booking booking){
    this.booking = booking;
    notifyListeners();
  }
  
  void reset(){
    updateBooking(Booking.initial());
  }

  }


