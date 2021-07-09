import 'package:flutter/material.dart';
import 'package:owe_me/registration_page/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          ),
          OMTextField(
            iconData: Icons.email_outlined,
            isEmail: true,
            isPassword: false,
            hintText: 'Email',
          ),
          OMTextField(
            iconData: Icons.lock_outlined,
            isEmail: false,
            isPassword: true,
            hintText: 'Password',
          ),
        ],
      ),
    );
  }
}
