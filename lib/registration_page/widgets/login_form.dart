import 'package:flutter/material.dart';
import 'package:owe_me/registration_page/colors/colors.dart';
import 'package:owe_me/registration_page/widgets/widgets.dart';

// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isRememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          ),
          OMTextField(
            iconData: Icons.lock_outlined,
            isEmail: false,
            isPassword: true,
            hintText: 'Password',
            textEditingController: _passwordController,
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
  }
}
