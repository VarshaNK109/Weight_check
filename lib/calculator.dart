import 'dart:math';

class Calculator{

  final int height;
  final int weight;

  Calculator({this.height,this.weight});

  double _bmi;

  String CalculateBMI(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String ResultBMI(){


      if(_bmi>=25){
        return 'overweight';
      }else if(_bmi>18.5){
        return 'normal';
      }else{
        return 'underweight';
      }
    }



  String InterpretationBMI(){

    if(_bmi>=25){
      return 'You have a over weight than normal.Try to excercise more!';
    }else if(_bmi>18.5){
      return 'You have a normal weight.Good job!';
    }else{
      return 'You a underweight.Eat more!';
    }
  }

}