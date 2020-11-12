import 'package:flutter/material.dart';
import 'constant.dart';

class CalculateButton extends StatelessWidget {
  final Function onTap;
  final String bottomText;

  CalculateButton({this.onTap, this.bottomText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            bottomText,
            style: kCalculateButtonStyle,
          ),
        ),
      ),
    );
  }
}
