import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/registration/bloc/bloc.dart';
import 'package:owe_me/registration/bloc/login/login_bloc.dart';
import 'package:owe_me/registration/colors/colors.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

//TODO: When submitting disable all buttons
//TODO: Refactor some more. Specifically try to make a large code into sep priv widget
class RegistrationCard extends StatefulWidget {
  @override
  _RegistrationCardState createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  bool isSignUpScreen = true;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  //TODO: Flesh out name controller
  final TextEditingController signupNameController = TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();

  late LoginBloc loginBloc;
  late SignUpBloc signUpBloc;

  bool get isLoginPopulated =>
      loginEmailController.text.isNotEmpty &&
      loginPasswordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) =>
      state.isFormValid &&
      isLoginPopulated &&
      !state.isSubmitting! &&
      !state.isSuccess!;

  bool get isSignupPopulated =>
      signupEmailController.text.isNotEmpty &&
      signupPasswordController.text.isNotEmpty;

  bool isSignupButtonEnabled(SignUpState state) =>
      state.isFormValid &&
      isSignupPopulated &&
      !state.isSubmitting! &&
      !state.isSuccess!;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    signUpBloc = BlocProvider.of<SignUpBloc>(context);
    //TODO: Fix bug causing events to be called multiple times
    loginEmailController.addListener(_onEmailChanged);
    loginPasswordController.addListener(_onPasswordChanged);
    signupEmailController.addListener(_onSignUpEmailChanged);
    signupPasswordController.addListener(_onSignUpPasswordChanged);
  }

  //TODO when both logins are invalid terms of conditions is cut off. Make empty container bigger?
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SubmitButton(showShadow: true),
        EmptyRegistrationCardBackground(
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
                        userRepository: signUpBloc.userRepository,
                        nameController: signupNameController,
                        emailController: signupEmailController,
                        passwordController: signupPasswordController,
                      )
                    : LoginForm(
                        userRepository: loginBloc.userRepository,
                        emailController: loginEmailController,
                        passwordController: loginPasswordController,
                      ),
                TermsOfService(),
              ],
            ),
          ),
        ),
        isSignUpScreen
            ? BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  if (state.isSubmitting! || state.isSuccess!) {
                    return SubmitButton(
                      showProgress: true,
                      onPressed: null,
                    );
                  }
                  return SubmitButton(
                    onPressed: isSignupButtonEnabled(state)
                        ? _onSignUpSubmission
                        : null,
                  );
                },
              )
            : BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state.isSubmitting! || state.isSuccess!) {
                    return SubmitButton(
                      showProgress: true,
                      onPressed: null,
                    );
                  }

                  return SubmitButton(
                    onPressed:
                        isLoginButtonEnabled(state) ? _onLoginSubmission : null,
                  );
                },
              )
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

  void _onSignUpEmailChanged() {
    signUpBloc.add(SignUpEmailChanged(email: signupEmailController.text));
  }

  void _onSignUpPasswordChanged() {
    signUpBloc
        .add(SignUpPasswordChanged(password: signupPasswordController.text));
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

  void _onLoginSubmission() {
    loginBloc.add(
      LoginWithCredentialsPressed(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ),
    );
  }

  void _onSignUpSubmission() {
    signUpBloc.add(SignUpWithCredentialsPressed(
      email: signupEmailController.text,
      password: signupPasswordController.text,
    ));
  }
}
