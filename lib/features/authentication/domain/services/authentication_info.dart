class AuthenticationInfo {
  bool isError;
  String? message;

//<editor-fold desc="Data Methods">

  AuthenticationInfo({
    required this.isError,
    this.message,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthenticationInfo &&
          runtimeType == other.runtimeType &&
          isError == other.isError &&
          message == other.message);

  @override
  int get hashCode => isError.hashCode ^ message.hashCode;

  @override
  String toString() {
    return 'AuthenticationInfo{' +
        ' isError: $isError,' +
        ' message: $message,' +
        '}';
  }

  AuthenticationInfo copyWith({
    bool? isError,
    String? message,
  }) {
    return AuthenticationInfo(
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isError': isError,
      'message': message,
    };
  }

  factory AuthenticationInfo.fromMap(Map<String, dynamic> map) {
    return AuthenticationInfo(
      isError: map['isError'] as bool,
      message: map['message'] as String,
    );
  }

//</editor-fold>
}