
import 'package:dartz/dartz.dart';

import 'package:architectures_demo/core/error/failure.dart';
import 'package:architectures_demo/features/users/domain/entities/user.dart';
import 'package:architectures_demo/features/users/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Failure, List<User>>> call() async {
    return await repository.getUsers();
  }
}