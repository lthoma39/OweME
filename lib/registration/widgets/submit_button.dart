import 'package:flutter/material.dart';
import 'package:owe_me/config/config.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({
    this.showShadow = false,
    this.showProgress = false,
    this.onPressed,
  });

  final bool showShadow;
  final bool showProgress;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.screenHeight / 3.5 + SizeConfig.screenHeight / 2.48,
        ),
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                  offset: Offset(0, 1),
                ),
            ],
          ),
          child: showShadow
              ? null
              : showProgress
                  ? CircularProgressIndicator()
                  : GestureDetector(
                      onTap: onPressed!,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.green[200]!,
                              Colors.blue[400]!,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
