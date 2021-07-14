import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpEmailChanged extends SignUpEvent {
  SignUpEmailChanged({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  SignUpPasswordChanged({
    required this.password,
  });

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpWithCredentialsPressed extends SignUpEvent {
  SignUpWithCredentialsPressed({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
