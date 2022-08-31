import 'package:flutter/material.dart';

class User {
  // late String token;
  late int uid;
  late String nickname;
  late String mobile;

  User(this.uid, this.nickname, this.mobile);
}

User guest = User(0, '', '');

class Profile with ChangeNotifier {
  bool _isAuthenticated = false;
  String _token = '';
  late final User _user;

  // void signIn(User user, String token) {
  //   _isAuthenticated = true;
  //   _token = token;
  //   _user = user;
  // }

  void signIn(String token) {
    _isAuthenticated = true;
    _token = token;
    notifyListeners();
  }

  void signOut() {
    _isAuthenticated = false;
    _token = '';
    _user = guest;
    notifyListeners();
  }

  bool get isAuthenticated {
    return _isAuthenticated;
  }
}