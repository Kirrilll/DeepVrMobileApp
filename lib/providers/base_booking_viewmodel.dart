abstract class IBookingViewModel{

  IBookingViewModel? getNext();
  IBookingViewModel? getPrev();

  int getPageNumber();
  bool isFinished();
}