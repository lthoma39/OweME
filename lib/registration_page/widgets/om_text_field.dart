import 'package:flutter/material.dart';
import 'package:owe_me/registration_page/colors/colors.dart';

class OMTextField extends StatelessWidget {
  const OMTextField({
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
