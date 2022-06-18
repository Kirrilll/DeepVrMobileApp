class ValidationHelper {

  static String? validatePhone(String value){
    const pattern = r'^\+?[78][-\(]?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$';
    var regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Неверно введет номер';
    }
    return null;
  }

  static String? validatePassword(String value){
    if(value.length < 6) return 'Пароль должен быть больше 6 символов';
    return null;
  }

  static String? validateEmail(String value){
    const pattern = r'^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$';
    var regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)){
      return 'Неверно введена почта';
    }
    return null;
  }
}