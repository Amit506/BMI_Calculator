import 'dart:ui';
import 'package:bmi_calculator/calculateMethod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'roundButton.dart';
import 'widgetcontainer.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'calculateButton.dart';
import 'resultPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculatior',
      theme: new ThemeData.dark().copyWith(
                                                        // giving a custom theme
        primaryColor: Color(0xFF0A0E21),                  // background color of appbar
        scaffoldBackgroundColor: Color(0xFF0A0E21),             //background color of body
      ),
      home: MainPage(),
    );
  }
}

enum Gender {
                        //defining enum 
  male,
  female,
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 140;              //variable controlling the height
  int weight = 50;                  //variable controlling the weight
  int age = 20;                             //variable controlling the age


  Color maleContainerColor =
      kinactiveContainerColor;                          // intializing color of male gesturebutton
  Color femaleContainerColor =
      kinactiveContainerColor;                            //intializing color of female gesturebutton
  void activenessDetector(Gender gender) {      //necessary function to change gesturebutton of male and female to active or inactive state
    setState(() {
                               

      if (gender == Gender.male) {
        if (maleContainerColor == kinactiveContainerColor) {
          maleContainerColor = kactiveContainerColor;
          femaleContainerColor = kinactiveContainerColor;
        } else {
          maleContainerColor = kinactiveContainerColor;
        }
      }
      if (gender == Gender.female) {
        if (femaleContainerColor == kinactiveContainerColor) {
          femaleContainerColor = kactiveContainerColor;
          maleContainerColor = kinactiveContainerColor;
        } else {
          femaleContainerColor = kinactiveContainerColor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,                // for getting title of textbar on centre
        title: Text(
          'BMI Calculator',
        ), 
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch,                                 // streching all elements  in column widget from crossaxis
        children: [
          Expanded(                           // 1st row having male and female container
                                               
            child: Row(                        
              children: [
                Expanded(                              // male container
                  child: WidgetContainer(
                                               // defining another function for customizing male container
                     onpressed: () {
                      activenessDetector(Gender
                          .male);                    // giving info to gesture detector that it is male container
                    },
                    colour: maleContainerColor,            //initializing default male container color
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center,                              //to keep all elemnts on center
                      children: [
                        Icon(
                          FontAwesomeIcons.male,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          'MALE',
                          style: ktextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(                             // female container
                  child: WidgetContainer(
                    onpressed: () {
                      activenessDetector(Gender
                          .female);                    // giving info to gesture detector that it is female container
                    },
                    colour: femaleContainerColor,                 //initializing default female container color
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.female,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          'FEMALE',
                          style: ktextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(                         // 2nd having height and slider
                                      
            child: WidgetContainer(                    // giving  widget as widgetcontainer
                                                               
              colour: Color(0xFF1D1E33),
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: ktextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,     // to get elements of row on the baseline 
                    textBaseline: TextBaseline.alphabetic,              
                    children: [
                      Text(
                        height.toString(),
                        style: ktextStyle2,
                      ),
                      Text(
                        'cm',
                        style: ktextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(                                                // using slider widget
                                                              
                    data: SliderTheme.of(context).copyWith(                         //using defined slider by us with little changes in slider theme 
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9),          
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),          
                    ),
                    child: Slider(                  // slider properties
                      value: height.toDouble(),
                      min: 100.0,
                      max: 200.0,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                      activeColor: Colors.red,
                      inactiveColor: Color(0xFF8D8E98),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(                // 3rd row having weight and age container
                                           
            child: Row(
              children: [
                Expanded(
                  child: WidgetContainer(
                    colour: kactiveContainerColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: ktextStyle,
                        ),
                        Text(weight.toString(), style: ktextStyle2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {                      //changing the weight ontapping
                                setState(() {
                                  weight++;                  
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {                                   //changing the weight ontapping
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: WidgetContainer(
                    colour: kactiveContainerColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: ktextStyle,
                        ),
                        Text(age.toString(), style: ktextStyle2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {                                    //changing the height ontapping
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {                                     //changing the height ontapping
                                  setState(() {
                                    age--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(                  // last widget having route to result page and necesary function to perform bmi calculation
            bottomText: 'CALCULATE',
            onTap: () {
              CalculateMethod calculate =
                  CalculateMethod(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calculate.bmiCalculate(),
                            bmiState: calculate.bmiState(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
