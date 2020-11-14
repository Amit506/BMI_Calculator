import 'package:bmi_calculator/calculateButton.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'widgetcontainer.dart';



//second route having results of calculation

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiState;
  ResultPage({this.bmiResult, this.bmiState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(centerTitle: true, title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your BMI',
                  style: kLargetextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: WidgetContainer(
              colour: kactiveContainerColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: kLargetextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(bmiState, style: kBMIStatrTextStyle),
                ],
              ),
            ),
          ),
          CalculateButton(                            // button for going back to previous route
            bottomText: 'CALCULATE  AGAIN ',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
