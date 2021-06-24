import 'package:flutter/material.dart';
import 'package:owe_me/config/config.dart';
import 'package:owe_me/registration_page/colors/colors.dart';
import 'package:owe_me/registration_page/widgets/widgets.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: <Widget>[
          TitleCard(),
          RegistrationCard(),
        ],
      ),
    );
  }
}
