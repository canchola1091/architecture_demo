
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    if (provider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (provider.message.isNotEmpty) {
      return Scaffold(body: Center(child: Text(provider.message)));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Clean Architecture Example')),
      body: ListView.builder(
        itemCount: provider.users.length,
        itemBuilder: (context, index) {
          final user = provider.users[index];
          return ListTile(title: Text(user.name, style: const TextStyle(color: Colors.black)));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.loadUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}