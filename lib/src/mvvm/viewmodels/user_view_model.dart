
import 'package:architectures_demo/src/mvvm/models/user.dart';
import 'package:flutter/foundation.dart';

class UserViewModel extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    _users = [
      User(id: 1, name: 'Alice'),
      User(id: 2, name: 'Bob'),
    ];
    notifyListeners();
  }
}