import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/registration/bloc/authentication/authentication.dart';
import 'package:owe_me/registration/repository/repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationInitial());

  final UserRepository userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapAuthenticationLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    if (await userRepository.isSignedIn()) {
      final user = await userRepository.getUser();
      yield AuthenticationSuccess(firebaseUser: user!);
    } else {
      yield AuthenticationFailure();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    final user = await userRepository.getUser();
    yield AuthenticationSuccess(firebaseUser: user!);
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedOutToState() async* {
    yield AuthenticationFailure();
    userRepository.signOut();
  }
}
