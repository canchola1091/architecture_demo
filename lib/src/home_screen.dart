
import 'package:flutter/material.dart';

import 'package:architectures_demo/src/mvvm/views/user_list_view.dart' as mvvm;
import 'package:architectures_demo/src/bloc/views/user_list_view.dart' as bloc;
import 'package:architectures_demo/src/mobx/views/user_list_view.dart' as mobx;
import 'package:architectures_demo/src/getx/views/user_list_view.dart' as getx;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Architecture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const mvvm.UserListView())),
              child: const Text('MVVM Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const bloc.UserListView())),
              child: const Text('BLoC Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => mobx.UserListView())),
              child: const Text('MobX Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const getx.UserListView())),
              child: const Text('GetX Example'),
            ),
          ],
        ),
      ),
    );
  }
}