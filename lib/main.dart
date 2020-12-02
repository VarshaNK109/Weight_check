import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'calculator.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),

    ),
  );
}

const Color activecolor = Color(0xFF29293C);
const Color inactivecolor = Color(0xFF111328);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String gen;
  int height = 180;
  int weight = 50;
  int age=50;

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
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    ontap: () {
                      setState(() {
                        gen = 'male';
                      });
                    },
                    colour: gen == 'male' ? activecolor : inactivecolor,
                    cardchild: IconContent(
                      ico: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    ontap: () {
                      setState(() {
                        gen = 'female';
                      });
                    },
                    colour: gen == 'female' ? activecolor : inactivecolor,
                    cardchild: IconContent(
                      ico: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF29293C),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Color(0xFFF6195F),
                      overlayColor: Color(0x69F6195F),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 50,
                      max: 250,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         button(
                           icon: FontAwesomeIcons.minus,
                           ontap: (){
                             setState(() {
                               weight--;
                             });
                           },
                         ),
                          SizedBox(width: 15.0,),
                          button(
                            icon: FontAwesomeIcons.plus,
                            ontap: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                      ],
                    ),
                    colour: Color(0xFF29293C),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                              icon: FontAwesomeIcons.minus,
                              ontap: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 15.0,),
                            button(
                              icon: FontAwesomeIcons.plus,
                              ontap: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: Color(0xFF29293C),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

              Calculator calc=Calculator(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                bmicalculate: calc.CalculateBMI(),
                bmiresult: calc.ResultBMI(),
                bmiinterpretation: calc.InterpretationBMI(),
              ),),);
            },
            child: Container(
              color: Color(0xFFF6195F),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'CALCULATE',
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

class ReusableCard extends StatelessWidget {
  final Widget cardchild;
  final Function ontap;
  final Color colour;
  ReusableCard({this.cardchild, this.ontap, this.colour});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData ico;
  final String gender;
  IconContent({this.ico, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ico,
          color: Colors.white,
          size: 90.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}

class button extends StatelessWidget {

  final IconData icon;
  final Function ontap;
  button({this.icon,this.ontap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.grey[700],
      constraints: BoxConstraints.tightFor(
        height: 45.0,
        width: 45.0,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      onPressed: ontap,
    );
  }
}


