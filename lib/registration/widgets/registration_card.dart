import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/config/size_config.dart';
import 'package:owe_me/registration/bloc/bloc.dart';
import 'package:owe_me/registration/bloc/login/login_bloc.dart';
import 'package:owe_me/registration/colors/colors.dart';
import 'package:owe_me/registration/repository/user_repository.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

//TODO: Refactor some more. Specifically try to make a large code into sep priv widget
class RegistrationCard extends StatefulWidget {
  RegistrationCard({required this.userRepository});

  final UserRepository userRepository;

  @override
  _RegistrationCardState createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  bool isSignUpScreen = true;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  //TODO: Flesh out signUp controllers like login controllers
  final TextEditingController signupNameController = TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();

  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    loginEmailController.addListener(_onEmailChanged);
    loginPasswordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SubmitButton(showShadow: true),
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight / 3.5),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              height: SizeConfig.screenHeight / 2.2,
              width: SizeConfig.screenWidth - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = false;
                              _clearControllers();
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignUpScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (!isSignUpScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  height: 2,
                                  width: 55,
                                  color: Colors.greenAccent,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = true;
                              _clearControllers();
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGNUP',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignUpScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (isSignUpScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  height: 2,
                                  width: 55,
                                  color: Colors.greenAccent,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isSignUpScreen
                        ? SignUpForm(
                            nameController: signupNameController,
                            emailController: signupEmailController,
                            passwordController: signupPasswordController,
                          )
                        : LoginForm(
                            userRepository: widget.userRepository,
                            emailController: loginEmailController,
                            passwordController: loginPasswordController,
                          ),
                    TermsOfService(),
                  ],
                ),
              ),
            ),
          ),
        ),
        SubmitButton(
          onPressed: isSignUpScreen ? _onSignUpSubmission : _onLoginSubmission,
        ),
      ],
    );
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    loginBloc.add(LoginEmailChanged(email: loginEmailController.text));
  }

  void _onPasswordChanged() {
    loginBloc.add(LoginPasswordChanged(password: loginPasswordController.text));
  }

  void _clearControllers() {
    if (isSignUpScreen) {
      loginEmailController.clear();
      loginPasswordController.clear();
    } else {
      signupNameController.clear();
      signupEmailController.clear();
      signupPasswordController.clear();
    }
  }

  //TODO apply proper bloc logic
  void _onLoginSubmission() {
    print('login test');
  }

  void _onSignUpSubmission() {
    print('signup test');
  }
}
