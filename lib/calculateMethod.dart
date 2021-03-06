import 'dart:math';


// method for calculatiing BMI and returning result

class CalculateMethod {
  CalculateMethod({this.height, this.weight});

  final int height;
  final int weight;

  String bmiCalculate() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiState() {
    double _bmi = weight / pow(height / 100, 2);
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else {
      return 'Normal';
    }
  }
}
