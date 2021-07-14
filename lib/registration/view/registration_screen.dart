import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/config/config.dart';
import 'package:owe_me/registration/bloc/bloc.dart';
import 'package:owe_me/registration/bloc/login/login.dart';
import 'package:owe_me/registration/colors/colors.dart';
import 'package:owe_me/registration/repository/user_repository.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({required this.userRepository});

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                TitleCard(),
                MultiBlocProvider(
                  providers: [
                    BlocProvider<LoginBloc>(
                      create: (context) =>
                          LoginBloc(userRepository: userRepository),
                    ),
                    BlocProvider<SignUpBloc>(
                      create: (context) =>
                          SignUpBloc(userRepository: userRepository),
                    ),
                  ],
                  child: RegistrationCard(userRepository: userRepository),
                ),
              ],
            ),
            Media(),
          ],
        ),
      ),
    );
  }
}
