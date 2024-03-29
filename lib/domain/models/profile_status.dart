import 'package:deepvr/features/profile/data/entities/loyalty_status.dart';

class ProfileStatus{
  final int id;
  final String imgPath;
  final String title;
  final int bonusPercent;

  ProfileStatus({required this.id ,required this.imgPath, required this.title, required this.bonusPercent});
  ProfileStatus.unidentified():
        id = -1,
        imgPath = 'assets/images/status.png',
        title = 'Unidentified',
        bonusPercent = 0;

  factory ProfileStatus.fromEntity(LoyaltyStatus loyaltyStatus) => ProfileStatus(
      id: loyaltyStatus.id,
      imgPath: 'assets/images/status.png',
      title: loyaltyStatus.title,
      bonusPercent: loyaltyStatus.cashback
  );

  bool equals(Object? status){
    if(status == null) return false;
    if(status.runtimeType != ProfileStatus) return false;
    return id == (status as ProfileStatus).id;
  }

  @override
  int get hashCode => id.hashCode;
}