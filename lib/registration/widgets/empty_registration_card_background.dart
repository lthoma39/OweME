import 'package:flutter/material.dart';
import 'package:owe_me/config/config.dart';

class EmptyRegistrationCardBackground extends StatelessWidget {
  EmptyRegistrationCardBackground({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight / 3.5),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(20),
          height: SizeConfig.screenHeight / 2.2,
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
          child: child,
        ),
      ),
    );
  }
}
