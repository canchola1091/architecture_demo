import 'package:dartz/dartz.dart';

import 'package:architectures_demo/core/error/failure.dart';
import 'package:architectures_demo/core/error/exceptions.dart';
import 'package:architectures_demo/features/users/domain/entities/user.dart';
import 'package:architectures_demo/features/users/domain/repositories/user_repository.dart';
import 'package:architectures_demo/features/users/data/datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final users = await dataSource.getUsers();
      return Right(users);
    } on ServerException {
      return Left(ServerFailure('Error en el servidor'));
    }
  }
}