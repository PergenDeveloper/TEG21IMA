import 'package:eglimpia/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<UserModel> users = [
  UserModel(
    name: 'Pergentino',
    phone: '222748484',
    email: 'pergendeveloper@gmail.com',
    password: '123456',
  ),
];

Future<bool> addUser(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();
  if (exist(user.email)) {
    return false;
  }
  users.add(user);
  prefs.setString('name', user.name ?? '');
  prefs.setString('phone', user.phone ?? '');
  return true;
}

bool exist(String? email) {
  for (var user in users) {
    if (user.email == email) {
      return true;
    }
  }
  return false;
}

Future<bool> login(String? email, String? password) async {
  final prefs = await SharedPreferences.getInstance();
  for (var user in users) {
    if (user.email == email && password == user.password) {
      prefs.setString('name', user.name ?? '');
      prefs.setString('phone', user.phone ?? '');
      return true;
    }
  }
  return false;
}
