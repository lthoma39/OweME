import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/registration/bloc/login/login.dart';
import 'package:owe_me/registration/colors/colors.dart';
import 'package:owe_me/registration/repository/user_repository.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

// ignore: must_be_immutable
//TODO: Refactor to be stateless see example A
class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
    required this.userRepository,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final UserRepository userRepository;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    //TODO: might not need the bloc listener HERE. Possibly use for snackbar stuff?
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure!) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Login Failure'),
                    Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
        }
        if (state.isSubmitting!) {
          print('Submitting');
        }
        if (state.isSuccess!) {
          print('success');
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  OMTextField(
                    iconData: Icons.email_outlined,
                    isEmail: true,
                    isPassword: false,
                    hintText: 'Email',
                    textEditingController: widget.emailController,
                    validationError: 'Invalid Email',
                    isValidated: !(state.isEmailValid!),
                  ),
                  OMTextField(
                    iconData: Icons.lock_outlined,
                    isEmail: false,
                    isPassword: true,
                    hintText: 'Password',
                    textEditingController: widget.passwordController,
                    validationError: 'Invalid Password',
                    isValidated: !(state.isPasswordValid!),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //example A
                          Checkbox(
                            value: isRememberMe,
                            activeColor: Palette.textColor2,
                            onChanged: (value) {
                              setState(() {
                                isRememberMe = !isRememberMe;
                              });
                            },
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 14,
                              color: Palette.textColor1,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
