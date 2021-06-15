import 'package:flutter/material.dart';
import 'package:owe_me/config/config.dart';
import 'package:owe_me/login_page/colors/colors.dart';

class LoginScreen extends StatelessWidget {
  final bool isSignUpScreen = true;
  final bool isRememberME = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: SizeConfig.screenHeight / 3,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight / 20,
                  right: SizeConfig.screenWidth / 10,
                ),
                color: Color(0xFF3b5999).withOpacity(.75),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 10.0,
                    ),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Welcome to',
                            style: TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 25,
                              color: Colors.greenAccent,
                            ),
                            children: [
                              TextSpan(
                                text: ' OweMe,',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.greenAccent,
                                ),
                                children: [],
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Sign up to continue',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
