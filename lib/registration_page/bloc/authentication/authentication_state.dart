import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  AuthenticationSuccess({
    required this.firebaseUser,
  });

  final User firebaseUser;

  @override
  List<Object> get props => [firebaseUser];
}

class AuthenticationFailure extends AuthenticationState {}
