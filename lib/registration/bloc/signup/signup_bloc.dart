import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/config/config.dart';
import 'package:owe_me/registration/bloc/bloc.dart';
import 'package:owe_me/registration/repository/repository.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.userRepository}) : super(SignUpState.initial());

  final UserRepository userRepository;

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpEmailChanged) {
      yield* mapSignUpEmailChangedToState(Validators.isValidEmail(event.email));
    }
    if (event is SignUpPasswordChanged) {
      yield* mapSignUpPasswordChangedToState(
          Validators.isValidPassword(event.password));
    }
    if (event is SignUpWithCredentialsPressed) {
      yield* mapSignUpWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<SignUpState> mapSignUpEmailChangedToState(bool email) async* {
    yield state.update(
      isEmailValid: email,
    );
  }

  Stream<SignUpState> mapSignUpPasswordChangedToState(bool password) async* {
    yield state.update(
      isPasswordValid: password,
    );
  }

  Stream<SignUpState> mapSignUpWithCredentialsPressedToState({
    required String email,
    required String password,
  }) async* {
    yield SignUpState.loading();
    try {
      await userRepository.signUp(email, password);
      yield SignUpState.success();
    } catch (error) {
      print(error);
      yield SignUpState.failure();
    }
  }
}
