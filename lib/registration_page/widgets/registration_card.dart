import 'package:flutter/material.dart';
import 'package:owe_me/config/size_config.dart';
import 'package:owe_me/registration_page/colors/colors.dart';

class RegistrationCard extends StatefulWidget {
  @override
  _RegistrationCardState createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  bool isSignUpScreen = true;
  bool isRememberME = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight / 3.5),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(20),
          height: SizeConfig.screenHeight / 2.25,
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
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      _OMTextField(
                        iconData: Icons.person_outlined,
                        isEmail: false,
                        isPassword: false,
                        hintText: 'Username',
                      ),
                      _OMTextField(
                        iconData: Icons.email_outlined,
                        isEmail: true,
                        isPassword: false,
                        hintText: 'Email',
                      ),
                      _OMTextField(
                        iconData: Icons.lock_outlined,
                        isEmail: false,
                        isPassword: true,
                        hintText: 'Password',
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  margin: EdgeInsets.only(top: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By pressing 'Submit' you agree to our ",
                      style: TextStyle(color: Palette.textColor2),
                      children: [
                        TextSpan(
                          //TODO: Implement recognizer: ,
                          text: 'terms & conditions',
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OMTextField extends StatelessWidget {
  const _OMTextField({
    Key? key,
    this.iconData = Icons.help,
    this.isEmail = false,
    this.isPassword = false,
    this.hintText = 'Default',
  }) : super(key: key);

  final IconData? iconData;
  final bool isPassword;
  final bool isEmail;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
              iconData,
              color: Palette.iconColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.textColor1),
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.textColor1),
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Palette.textColor1,
            )),
      ),
    );
  }
}
