
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import 'package:architectures_demo/features/users/domain/entities/user.dart';
import 'package:architectures_demo/features/users/domain/usecases/get_users.dart';
import 'package:architectures_demo/features/users/data/repositories/user_repository_impl.dart';
import 'package:architectures_demo/features/users/data/datasources/user_remote_datasource.dart';

class UserProvider extends ChangeNotifier {

  final GetUsers _getUsers;

  UserProvider({
    GetUsers? getUsers,
  }) : _getUsers = getUsers ?? GetUsers(
        UserRepositoryImpl(UserRemoteDataSourceImpl(http.Client())),
      );

  List<User> _users = [];
  List<User> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _message = '';
  String get message => _message;

  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await _getUsers();

    result.fold(
      (failure) {
        _message = failure.message;
      },
      (users) {
        _users = users;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}