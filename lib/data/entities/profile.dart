class Profile{
  String? name;
  String? token;

  Profile({this.name, this.token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['token'] = token;
    return data;
  }
}