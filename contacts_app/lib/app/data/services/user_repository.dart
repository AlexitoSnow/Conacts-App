import '../model/person.dart';
import '../model/user.dart';

abstract class UserRepository {
  static List<User> users = [];

  static User? loggedUser;

  static String? currentType;

  static void setCurrentUser(User user) {
    loggedUser = user;
    currentType = loggedUser is Person ? 'Person' : 'Company';
  }

  static bool existsNickname(User user) {
    return users.any((element) => element.nickname == user.nickname);
  }

  static bool existsEmail(User user) {
    return users.any((element) => element.email == user.email);
  }
}
