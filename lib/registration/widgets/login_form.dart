import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/registration/bloc/login/login.dart';
import 'package:owe_me/registration/colors/colors.dart';
import 'package:owe_me/registration/repository/user_repository.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  final UserRepository userRepository;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isRememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure!) {}
        if (state.isSubmitting!) {}
        if (state.isSuccess!) {}
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                OMTextField(
                  iconData: Icons.email_outlined,
                  isEmail: true,
                  isPassword: false,
                  hintText: 'Email',
                  textEditingController: _emailController,
                  validationError: 'Invalid Email',
                  isValidated: !(state.isEmailValid!),
                ),
                OMTextField(
                  iconData: Icons.lock_outlined,
                  isEmail: false,
                  isPassword: true,
                  hintText: 'Password',
                  textEditingController: _passwordController,
                  validationError: 'Invalid Password',
                  isValidated: !(state.isPasswordValid!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
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
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    loginBloc.add(LoginEmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    loginBloc.add(LoginPasswordChanged(password: _passwordController.text));
  }
}
