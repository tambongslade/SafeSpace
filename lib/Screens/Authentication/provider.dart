import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _token;
  String? _name;
  String? _id;

  String? get token => _token;
  String? get name => _name;
  String? get id => _id;

  void setUser(String token, String id, String name) {
    _token = token;
    _id = id;
    _name = name;
    notifyListeners();
  }
}
