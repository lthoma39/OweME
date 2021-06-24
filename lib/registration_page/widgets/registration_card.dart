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
      padding: const EdgeInsets.only(top: 200),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(20),
          height: SizeConfig.screenHeight / 2,
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
            ],
          ),
        ),
      ),
    );
  }
}
