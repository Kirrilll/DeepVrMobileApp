import '../models/booking_date_model/room_model.dart';

class TimeHelper{

   static bool isTimeAvailable(Map<int, Room> allRooms, int guestCount, List<int> roomsId){
    for(int id in roomsId){
      if(allRooms.containsKey(id)){
        if(allRooms[id]!.guestMax > guestCount){
          return true;
        }
      }
    }
    return false;
  }
}