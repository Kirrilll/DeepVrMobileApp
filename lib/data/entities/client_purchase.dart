import 'dart:convert';

class ClientPurchase {
  int id;
  String bookingDate;
  int gameId;
  int roomId;
  int guestQuantity;
  int price;
  String? comment;
  String status;
  String? deletedAt;
  String createdAt;
  String updatedAt;
  String? commentUser;
  int? userId;
  String userName;
  String userPhone;
  int timeDuration;
  int? roomBlocked;
  int? externalId;
  int clientId;

  ClientPurchase(
      {required this.id,
      required this.bookingDate,
      required this.gameId,
      required this.roomId,
      required this.guestQuantity,
      required this.price,
      this.comment,
      required this.status,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt,
      this.commentUser,
      this.userId,
      required this.userName,
      required this.userPhone,
      required this.timeDuration, this.roomBlocked,
      this.externalId,
      required this.clientId});

  factory ClientPurchase.fromJsonMap(Map<String, dynamic> json) =>
      ClientPurchase(
          id: json['id'],
          bookingDate: json['booking_date'],
          gameId: json['game_id'],
          roomId: json['room_id'],
          guestQuantity: json['guest_quantity'],
          price: json['price'],
          comment: json['comment'],
          status: json['status'],
          deletedAt: json['deleted_at'],
          createdAt: json['created_at'],
          updatedAt: json['updated_at'],
          commentUser: json['comment_user'],
          userId: json['user_id'],
          userName: json['user_name'],
          userPhone: json['user_phone'],
          timeDuration: json['time_duration'],
          roomBlocked: json['room_blocked'],
          externalId: json['external_id'],
          clientId: json['client_id']);

  factory ClientPurchase.fromMap(String source) => ClientPurchase.fromJsonMap(json.decode(source));

  static List<ClientPurchase> listFromJson(String source) {
    return List<ClientPurchase>.from(json.decode(source).map((x) => ClientPurchase.fromJsonMap(x)));
  }
}
