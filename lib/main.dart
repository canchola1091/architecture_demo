
import 'package:flutter/material.dart';

import 'package:architectures_demo/src/home_screen.dart';
// import 'mvvm/views/user_list_screen.dart' as mvvm;
// import 'bloc/views/user_list_screen.dart' as bloc;
// import 'mobx/views/user_list_screen.dart' as mobx;
// import 'getx/views/user_list_screen.dart' as getx;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}