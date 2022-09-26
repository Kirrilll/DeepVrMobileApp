import 'package:deepvr/domain/models/bonus.dart';
import 'package:deepvr/domain/models/profile_status.dart';
import 'package:deepvr/domain/models/purchase.dart';
import 'package:deepvr/domain/models/user.dart';

class Profile {
  final ProfileStatus _status;
  final User _user;
  final List<Purchase> _purchaseHistory;
  final List<Bonus> _bonuses;

  Profile.unidentified():
        _status = ProfileStatus.unidentified(),
        _user = User.initial(),
        _purchaseHistory = [],
        _bonuses = [];

  const Profile({
    required ProfileStatus status,
    required User user,
    required List<Purchase> purchaseHistory,
    required List<Bonus> bonuses,
  })  : _status = status,
        _user = user,
        _purchaseHistory = purchaseHistory,
        _bonuses = bonuses;


  ProfileStatus get status => _status;
  User get user => _user;
  List<Purchase> get purchaseHistory => _purchaseHistory;
  List<Bonus> get bonuses => _bonuses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          runtimeType == other.runtimeType &&
          _status == other._status &&
          _user == other._user &&
          _purchaseHistory == other._purchaseHistory &&
          _bonuses == other._bonuses);

  @override
  int get hashCode =>
      _status.hashCode ^
      _user.hashCode ^
      _purchaseHistory.hashCode ^
      _bonuses.hashCode;

  @override
  String toString() {
    return 'Profile{' +
        ' _status: $_status,' +
        ' _user: $_user,' +
        ' _purchaseHistory: $_purchaseHistory,' +
        ' _bonuses: $_bonuses,' +
        '}';
  }

  Profile copyWith({
    ProfileStatus? status,
    User? user,
    List<Purchase>? purchaseHistory,
    List<Bonus>? bonuses,
  }) {
    return Profile(
      status: status ?? _status,
      user: user ?? _user,
      purchaseHistory: purchaseHistory ?? _purchaseHistory,
      bonuses: bonuses ?? _bonuses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_status': _status,
      '_user': _user,
      '_purchaseHistory': _purchaseHistory,
      '_bonuses': _bonuses,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      status: map['_status'] as ProfileStatus,
      user: map['_user'] as User,
      purchaseHistory: map['_purchaseHistory'] as List<Purchase>,
      bonuses: map['_bonuses'] as List<Bonus>,
    );
  }
}