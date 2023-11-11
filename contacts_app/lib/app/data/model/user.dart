import 'contact.dart';

class User {
  String nickname;
  String password;
  late String email;
  Contact? contact;

  User({
    required this.nickname,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          nickname == other.nickname &&
          password == other.password;
}
