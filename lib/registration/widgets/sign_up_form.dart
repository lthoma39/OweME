import 'package:flutter/material.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  @override
  Widget build(BuildContext context) {
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
          ),
          OMTextField(
            iconData: Icons.lock_outlined,
            isEmail: false,
            isPassword: true,
            hintText: 'Password',
            textEditingController: widget.passwordController,
          ),
          TermsOfService(),
        ],
      ),
    );
  }
}
