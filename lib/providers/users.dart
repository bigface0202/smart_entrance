import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './user.dart';

class Users with ChangeNotifier {
  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }

  int get userCount {
    return _users.length;
  }

  int get activeUsers {
    return _users.where((actUsers) => actUsers.entered).length;
  }

  User findById(String id) {
    return _users.firstWhere((user) => user.id == id);
  }

  Future<void> fetchAndSetUsers() async {
    var url = 'https://esp32-felica.firebaseio.com/User.json';
    try {
      final response =
          await http.get(url).timeout(Duration(seconds: 5), onTimeout: () {
        return null;
      });
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<User> loadedUsers = [];
      extractedData.forEach((userId, userData) {
        loadedUsers.add(User(
          id: userId,
          entered: userData['entered'],
          felicaId: userData['id'],
        ));
      });
      _users = loadedUsers;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
