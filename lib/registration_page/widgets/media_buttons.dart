import 'package:flutter/material.dart';
import 'package:owe_me/registration_page/colors/colors.dart';

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text('Or Signin With'),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MediaButtons(
                  backgroundColor: Palette.facebookColor,
                  iconData: Icons.facebook_outlined,
                  buttonName: 'Facebook',
                ),
                _MediaButtons(
                  backgroundColor: Palette.googleColor,
                  iconData: Icons.gamepad,
                  buttonName: 'Google',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MediaButtons extends StatelessWidget {
  const _MediaButtons({
    required this.backgroundColor,
    required this.iconData,
    required this.buttonName,
  });

  final Color backgroundColor;
  final IconData iconData;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: Size(145, 40),
        backgroundColor: backgroundColor,
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: 5),
          Text(buttonName),
        ],
      ),
    );
  }
}
