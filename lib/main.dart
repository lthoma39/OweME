import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/home_screen/view/home_screen.dart';
import 'package:owe_me/registration/bloc/bloc.dart';
import 'package:owe_me/registration/bloc/bloc_observer.dart';
import 'package:owe_me/registration/repository/repository.dart';
import 'registration/view/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  final UserRepository userRepository = UserRepository();

  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AuthenticationStarted()),
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({required this.userRepository});

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            return RegistrationScreen(
              userRepository: userRepository,
            );
          } else if (state is AuthenticationSuccess) {
            return HomeScreen(user: state.firebaseUser);
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: Container(
                child: Center(
                  child: Text('TEST'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
