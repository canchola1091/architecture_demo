
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:architectures_demo/core/error/exceptions.dart';
import 'package:architectures_demo/features/users/data/models/user_model.dart';
abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  
  final http.Client client;

  UserRemoteDataSourceImpl(this.client);

  @override
  Future<List<UserModel>> getUsers() async {
    
    // final response = await client.get(
    //   Uri.parse('https://jsonplaceholder.typicode.com/users'),
    // );

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

}