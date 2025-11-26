
import 'package:dartz/dartz.dart';

import 'package:architectures_demo/core/error/failure.dart';
import 'package:architectures_demo/features/users/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
}