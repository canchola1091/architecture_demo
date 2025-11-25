
import 'package:get/get.dart';

import 'package:architectures_demo/src/getx/models/user.dart';

class UserController extends GetxController {
  
  RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    users.assignAll([
      User(id: 1, name: 'Alice'),
      User(id: 2, name: 'Bob'),
    ]);
  }
}