



import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/models/user_model.dart';

class AuthLocalService {
  // 🟢 حفظ يوزر جديد (Signup)
  Future<void> saveUser(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();

  String? usersJson = prefs.getString('users');
  Map<String, dynamic> users = usersJson != null
      ? Map<String, dynamic>.from(jsonDecode(usersJson))
      : {};

  users[user.email] = user.toJson();

  await prefs.setString('users', jsonEncode(users));
}

  // 🟢 تسجيل الدخول (Login)
  Future<bool> login(String email, String password) async {
  final prefs = await SharedPreferences.getInstance();

  String? usersJson = prefs.getString('users');
  if (usersJson == null) return false;

  Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson));

  if (users.containsKey(email) && users[email]["password"] == password) {
    await prefs.setString("loggedInEmail", email);
    return true;
  }

  return false;
}


  // 🟢 جلب بيانات اليوزر الحالي
  Future<UserModel?> getUserData() async {
  final prefs = await SharedPreferences.getInstance();

  String? usersJson = prefs.getString('users');
  String? loggedInEmail = prefs.getString("loggedInEmail");

  if (usersJson == null || loggedInEmail == null) return null;

  Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson));
  if (!users.containsKey(loggedInEmail)) return null;

  return UserModel.fromJson(users[loggedInEmail]);
}


  // 🟢 تحديث صورة البروفايل لليوزر الحالي
  Future<void> updateProfileImage(String path) async {
  final prefs = await SharedPreferences.getInstance();

  String? usersJson = prefs.getString('users');
  String? loggedInEmail = prefs.getString("loggedInEmail");

  if (usersJson == null || loggedInEmail == null) return;

  Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson));

  if (users.containsKey(loggedInEmail)) {
    UserModel user = UserModel.fromJson(users[loggedInEmail]);
    UserModel updatedUser = UserModel(
      name: user.name,
      email: user.email,
      password: user.password,
      profileImage: path,
    );

    users[loggedInEmail] = updatedUser.toJson();
    await prefs.setString('users', jsonEncode(users));
  }
}


  // // 🟢 تسجيل خروج
  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove("loggedInEmail"); // نمسح بس اليوزر الحالي
  // }
}
