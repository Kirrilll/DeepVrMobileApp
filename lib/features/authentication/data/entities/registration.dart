class Registration{
  String? phone;
  String? email;
  String? password;
  String? passwordRepeat;

  Registration({this.phone, this.email, this.password, this.passwordRepeat});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['password-repeat'] = passwordRepeat;
    return data;
  }
}