import '../../../../core/usecases/special_types/fetching_state.dart';
import '../../../../domain/models/booking_information.dart';

class ResultState{
  BookingInformation? bookingInformation;
  String? errorMessage;
  FetchingState fetchingStatus = FetchingState.idle;


  ResultState({
    this.bookingInformation,
    this.errorMessage,
    required this.fetchingStatus,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ResultState &&
              runtimeType == other.runtimeType &&
              bookingInformation == other.bookingInformation &&
              errorMessage == other.errorMessage &&
              fetchingStatus == other.fetchingStatus);

  @override
  int get hashCode =>
      bookingInformation.hashCode ^
      errorMessage.hashCode ^
      fetchingStatus.hashCode;

  @override
  String toString() {
    return 'ResultState{' +
        ' bookingInformation: $bookingInformation,' +
        ' errorMessage: $errorMessage,' +
        ' fetchingStatus: $fetchingStatus,' +
        '}';
  }

  ResultState copyWith({
    BookingInformation? bookingInformation,
    String? errorMessage,
    FetchingState? fetchingStatus,
  }) {
    return ResultState(
      bookingInformation: bookingInformation ?? this.bookingInformation,
      errorMessage: errorMessage ?? this.errorMessage,
      fetchingStatus: fetchingStatus ?? this.fetchingStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingInformation': bookingInformation,
      'errorMessage': errorMessage,
      'fetchingStatus': fetchingStatus,
    };
  }

  factory ResultState.fromMap(Map<String, dynamic> map) {
    return ResultState(
      bookingInformation: map['bookingInformation'] as BookingInformation,
      errorMessage: map['errorMessage'] as String,
      fetchingStatus: map['fetchingStatus'] as FetchingState,
    );
  }

}