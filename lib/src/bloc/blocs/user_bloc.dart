
import 'package:architectures_demo/src/bloc/models/user.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class FetchUsersEvent extends UserEvent {}

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded(this.users);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
  }

  void _onFetchUsers(FetchUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    await Future.delayed(const Duration(seconds: 2));
    final users = [
      User(id: 1, name: 'Alice'),
      User(id: 2, name: 'Bob'),
    ];
    emit(UserLoaded(users));
  }
}