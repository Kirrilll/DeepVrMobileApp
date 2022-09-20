import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/features/booking/data/repositories/booking_repository.dart';
import 'package:deepvr/features/booking/usecases/interfaces/i_booking_model.dart';
import 'package:deepvr/features/booking/domain/services/booking_service.dart';
import 'package:deepvr/features/booking/usecases/updating_keys.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/locator.dart';
import '../../../../domain/models/booking_information.dart';
import 'result_state.dart';


//TODO нормально обрабатывать ошибку
//Вызывать модалку ошибки
class ResultsModel with ChangeNotifier implements IBookingModel{
  ResultState _resultState = ResultState(fetchingStatus: FetchingState.idle);
  final _bookingService = locator<BookingService>();
  final _bookingRepository = locator<BookingRepository>();

  ResultsModel(){
    init();
    _bookingService.addListener(init);
  }

  BookingInformation? get bookingInformation => _resultState.bookingInformation;
  FetchingState get fetchingStatus => _resultState.fetchingStatus;
  String? get errorMessage => _resultState.errorMessage;
  ResultState get state => _resultState;

  void init(){
    if(_check()){
      _getResults();
    }
  }

  void setState(ResultState state){
    _resultState = state;
    notifyListeners();
  }

  bool _check(){
    if(_bookingService.booking.selectedType == null) return false;
    if(_bookingService.booking.selectedGame == null) return false;
    if(_bookingService.booking.guestCount == null) return false;
    if(_bookingService.booking.selectedDate == null) return false;
    if(_bookingService.booking.selectedTime == null) return false;
    if(_bookingService.booking.name == null) return false;
    if(_bookingService.booking.phone == null) return false;
    return true;
  }

  Future<void> _getResults() async{
    setState(_resultState.copyWith(
        fetchingStatus: FetchingState.loading,
        errorMessage: '',
    ));
    final res = await _bookingRepository.getBookingInformation(_bookingService.booking);
    if(res == null){
      setState(_resultState.copyWith(fetchingStatus: FetchingState.error, errorMessage: 'Ошибка'));
    }
    else{
      setState(_resultState.copyWith(bookingInformation: res, fetchingStatus: FetchingState.successful));
    }
  }

  Future<void> book() async{
    setState(_resultState.copyWith(fetchingStatus: FetchingState.loading));
    final booking = _bookingService.booking;
    final res = await _bookingRepository.book({
      "guest_quantity": booking.guestCount.toString(),
      "guest_date": booking.selectedDate.toString(),
      "guest_time": booking.selectedTime?.time,
      "user_phone": booking.phone,
      "user_name": booking.name,
    }, booking.selectedGame!.id);
    if(res?.error == 0){
      await locator<AppRouter>().pushNamed('successful');
      setState(_resultState.copyWith(fetchingStatus: FetchingState.idle));
      _bookingService.updateBooking(Booking.initial(), getUpdatingKey());
    }
    else{
      setState(_resultState.copyWith(fetchingStatus: FetchingState.error, errorMessage: res?.errorText ?? 'Нет соединения'));
    }
  }

  @override
  bool isFinished() => fetchingStatus == FetchingState.successful;

  @override
  void onNext() {}

  @override
  Future<void> onNextAsync() async {
    await book();
  }

  @override
  String getUpdatingKey() => cascadeUpdateKey;

}