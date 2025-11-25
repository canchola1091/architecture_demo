
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:architectures_demo/src/getx/controllers/user_controller.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(title: const Text('GetX Example')),
      body: Obx(
        () => (controller.users.isNotEmpty)
        ? ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];
            return ListTile(title: Text(user.name));
          },
        )
        : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}