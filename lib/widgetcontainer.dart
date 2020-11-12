import 'package:flutter/material.dart';

class WidgetContainer extends StatelessWidget {
  final Widget
      containerChild; // this widget has the basic properties of our bmi calculator that are used many times
  final colour;
  final Function onpressed;
  WidgetContainer({this.colour, this.containerChild, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: containerChild,
        height: 200.0,
        width: 170.0,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
