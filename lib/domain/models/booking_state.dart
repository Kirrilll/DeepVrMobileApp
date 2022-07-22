import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/booking.dart';

class BookingState{
  Booking booking;
  int stepIndex;
  FetchingState bookingStatus;
  bool isBooked;

  BookingState({
    required this.booking,
    required this.stepIndex,
    required this.isBooked,
    required this.bookingStatus
  });


  factory BookingState.initial() => BookingState(
      booking: Booking.initial(),
      stepIndex: 0,
      isBooked: false,
      bookingStatus: FetchingState.idle
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingState &&
          runtimeType == other.runtimeType &&
          booking == other.booking &&
          stepIndex == other.stepIndex &&
          isBooked == other.isBooked);

  @override
  int get hashCode => booking.hashCode ^ stepIndex.hashCode ^ isBooked.hashCode;

  @override
  String toString() {
    return 'BookingState{' +
        ' booking: $booking,' +
        ' stepIndex: $stepIndex,' +
        ' isBooked: $isBooked,' +
        '}';
  }

  BookingState copyWith({
    Booking? booking,
    int? stepIndex,
    bool? isBooked,
    FetchingState? bookingStatus
  }) {
    return BookingState(
      booking: booking ?? this.booking,
      stepIndex: stepIndex ?? this.stepIndex,
      isBooked: isBooked ?? this.isBooked,
      bookingStatus: bookingStatus ?? this.bookingStatus
    );
  }


}