import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:latihan/tugas/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoggedIn = false;

  UserModel? get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> register(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toMap()));
    _user = user;
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      final data = json.decode(userData);
      final savedUser = UserModel.fromMap(data);

      if (savedUser.email == email && savedUser.password == password) {
        _user = savedUser;
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}