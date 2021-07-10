import 'package:flutter/material.dart';
import 'package:owe_me/registration/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            textEditingController: _nameController,
          ),
          OMTextField(
            iconData: Icons.email_outlined,
            isEmail: true,
            isPassword: false,
            hintText: 'Email',
            textEditingController: _emailController,
          ),
          OMTextField(
            iconData: Icons.lock_outlined,
            isEmail: false,
            isPassword: true,
            hintText: 'Password',
            textEditingController: _passwordController,
          ),
        ],
      ),
    );
  }
}
