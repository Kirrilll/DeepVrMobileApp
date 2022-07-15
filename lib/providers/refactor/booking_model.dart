import 'package:deepvr/models/booking.dart';
import 'package:deepvr/models/booking_step.dart';
import 'package:deepvr/usecases/configurations/booking_step_config.dart';
import 'package:flutter/cupertino.dart';


/*
* Возможно isFinished вынести в единный интерфейс и в каждой моделе следить за этим
* присваивать в booking только после нажатия next
* также additionalFunc обустроить в next
* */
class BookingModel with ChangeNotifier{
  final List<BookingStep> _steps = bookingSteps;
  Booking booking = Booking.initial();
  int _currPageIndex = 0;
  
  List<BookingStep> get steps => _steps;
  int get currStepIndex => _currPageIndex;
  bool get mayNext => steps[_currPageIndex].isFinished(booking) && _currPageIndex < _steps.length-1;
  bool get mayBack => _currPageIndex > 0;


  setCurrStepIndex(int index){
    if(index > 0 && index < _steps.length -1){
      _currPageIndex = index;
      notifyListeners();
    }
  }


  void next(){
    if(mayNext){
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
  
  void init(){
    updateBooking(Booking.initial());
  }

  }


