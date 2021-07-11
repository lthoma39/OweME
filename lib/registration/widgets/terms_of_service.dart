import 'package:flutter/material.dart';
import 'package:owe_me/registration/colors/colors.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 5),
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
    );
  }
}
