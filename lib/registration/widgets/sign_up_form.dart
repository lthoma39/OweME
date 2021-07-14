import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owe_me/registration/bloc/bloc.dart';
import 'package:owe_me/registration/repository/repository.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.userRepository,
  }) : super(key: key);

  final UserRepository userRepository;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.isFailure!) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Sign Up Failure'),
                    Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          print('Sign up Failure');
        }
        if (state.isSubmitting!) {
          print('Submitting sign up');
        }
        if (state.isSuccess!) {
          print('Sign up Success');
        }
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              OMTextField(
                iconData: Icons.person_outlined,
                isEmail: false,
                isPassword: false,
                hintText: 'Username',
                textEditingController: widget.nameController,
              ),
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
            ],
          ),
        );
      },
    );
  }
}
