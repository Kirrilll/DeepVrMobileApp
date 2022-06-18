class UserInfo {
  String? telephone;
  String? email;
  String? name;

  UserInfo({this.telephone, this.email, this.name});

  UserInfo.fromJson(Map<String, dynamic> json) {
    telephone = json['telephone'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telephone'] = telephone;
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}