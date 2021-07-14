import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/config/config.dart';
import 'package:owe_me/registration/bloc/login/login.dart';
import 'package:owe_me/registration/repository/repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.userRepository}) : super(LoginState.initial());

  final UserRepository userRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield* mapLoginEmailChangedToState(Validators.isValidEmail(event.email));
    }
    if (event is LoginPasswordChanged) {
      yield* mapLoginPasswordChangedToState(
          Validators.isValidPassword(event.password));
    }
    if (event is LoginWithCredentialsPressed) {
      yield* mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> mapLoginEmailChangedToState(bool email) async* {
    yield state.update(
      isEmailValid: email,
    );
  }

  Stream<LoginState> mapLoginPasswordChangedToState(bool password) async* {
    yield state.update(
      isPasswordValid: password,
    );
  }

  Stream<LoginState> mapLoginWithCredentialsPressedToState({
    required String email,
    required String password,
  }) async* {
    yield LoginState.loading();
    try {
      await userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (error) {
      print(error);
      yield LoginState.failure();
    }
  }
}
