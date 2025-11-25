
import 'package:mobx/mobx.dart';

import 'package:architectures_demo/src/mobx/models/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  List<User> users = [];

  @action
  Future<void> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    users = [
      User(id: 1, name: 'Alice'),
      User(id: 2, name: 'Bob'),
    ];
  }
}