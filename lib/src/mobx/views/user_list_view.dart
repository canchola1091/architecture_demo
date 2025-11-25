import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/user_store.dart';

class UserListView extends StatelessWidget {
  UserListView({super.key});

  final userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userStore.fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(title: const Text('MobX Example')),
            body: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: userStore.users.length,
                  itemBuilder: (context, index) {
                    final user = userStore.users[index];
                    return ListTile(title: Text(user.name));
                  },
                );
              },
            ),
          );
        } else {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}