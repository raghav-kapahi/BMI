import 'dart:math';

class calculation {
  calculation({required this.height, required this.weight}) {}

  // ignore: empty_constructor_bodies
  final int height;
  double _bmi = 0.0;
  final int weight;
  String calc() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpret() {
    if (_bmi >= 25) {
      return 'PLease Exercise More Often.';
    } else if (_bmi > 18.5) {
      return 'You are perfectly fine.';
    } else {
      return 'Please take nutritious food more often';
    }
  }
}
