
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:architectures_demo/src/mvvm/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (_) => UserViewModel()..fetchUsers(),
      child: Consumer<UserViewModel>(
        builder: (context, model, child) {
          log('MODEL: ${  model.users.length}');
          return Scaffold(
            appBar: AppBar(title: const Text('MVVM Example')),
            body: (model.users.isNotEmpty)
            ? ListView.builder(
              itemCount: model.users.length,
              itemBuilder: (context, index) {
                final user = model.users[index];
                return ListTile(title: Text(user.name));
              },
            )
            : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}