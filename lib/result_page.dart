import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final String bmiresult;
  final String bmicalculate;
  final String bmiinterpretation;

  ResultPage({this.bmiresult,this.bmicalculate,this.bmiinterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33),
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'YOUR RESULT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiresult.toUpperCase(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(bmicalculate,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0,
                  ),),
                  Text(bmiinterpretation,textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),),
                ],
              ),
              color: Color(0xFF29293C),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Color(0xFFF6195F),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'RE-CALCULATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              height: 70.0,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
