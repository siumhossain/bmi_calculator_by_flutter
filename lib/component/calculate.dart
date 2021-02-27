import 'dart:math';
class Calculate{
  Calculate({this.height,this.weight});
  final int height;
  final int weight;

  double _bmi;
  String calculateBmi(){
    _bmi = weight /  pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>= 25){
      return 'Overweight';
    }else if(_bmi > 18.5 ){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String suggestion(){
    if(_bmi>= 25){
      return 'Do some exercise.Because your BMI Rate is too high.';
    }else if(_bmi > 18.5 ){
      return 'Oh!nice,Enjoy your healthy life.';
    }
    else{
      return 'BMI rate is too slow.Make sure you eat something healthy.';
    }
  }
}