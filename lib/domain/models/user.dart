class User{
  String? token;
  String? login;
  String? phone;

  User(this.token, this.login, this.phone);

  User.initial(){
    login = null;
    token = null;
    phone = null;
  }

  @override
  String toString() {
    return 'User{token: $token, login: $login, phone: $phone}';
  }
}