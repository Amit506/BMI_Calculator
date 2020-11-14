import 'package:flutter/material.dart';


//coustamized button used in male and female container

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        onPressed();
      },
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: CircleBorder(),
      fillColor: Colors.red,
    );
  }
}
