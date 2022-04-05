class Order {
  String? userName;
  String? userPhone;
  String? guestDate;
  String? guestTime;

  Order({this.userName, this.userPhone, this.guestDate, this.guestTime});

  Order.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userPhone = json['user_phone'];
    guestDate = json['guest_date'];
    guestTime = json['guest_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['user_phone'] = userPhone;
    data['guest_date'] = guestDate;
    data['guest_time'] = guestTime;
    return data;
  }
}