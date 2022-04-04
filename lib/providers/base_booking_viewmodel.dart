abstract class IBookingViewModel{

  IBookingViewModel? getNext();
  IBookingViewModel? getPrev();

  bool isFinished();
}