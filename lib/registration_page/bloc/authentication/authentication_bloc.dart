import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/registration_page/bloc/authentication/authentication.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationBloc> {
  AuthenticationBloc(AuthenticationBloc initialState) : super(initialState);

  @override
  Stream<AuthenticationBloc> mapEventToState(AuthenticationEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
