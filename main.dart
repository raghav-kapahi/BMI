import 'package:flutter/material.dart';
import 'input_page.dart';
import 'fronpage.dart';
import 'female_input.dart';
import 'calculation.dart';
import 'dart:math';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFFE1A88B),
          accentColor: Colors.teal,
          //scaffoldBackgroundColor: Color(0xFFD7C9B4),
          scaffoldBackgroundColor: Colors.yellow,
          textTheme: TextTheme(
            body1: TextStyle(
              //  fontStyle: FontStyle.italic,
              fontSize: 30.0,
              fontFamily: 'Koho',
              fontWeight: FontWeight.bold,
            ),
          )),
      home: frontpage(),
    );
  }
}

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

class frontpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/BMI-Calculator.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 150,
                margin: EdgeInsets.all(15.0),
                child: RaisedButton(
                  elevation: 20.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputPage()),
                    );
                  },
                  color: Colors.white,
                  splashColor: Color(0xFFE1A88B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(tag: 'h', child: Icon(Icons.male_outlined)),
                      Hero(
                        tag: 'j',
                        child: Text(
                          'MALE',
                          style: TextStyle(
                            fontFamily: 'Bad',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 250,
                width: 150,
                margin: EdgeInsets.all(15.0),
                child: RaisedButton(
                  elevation: 20.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FInputPage()),
                    );
                  },
                  color: Colors.white,
                  splashColor: Color(0xFFE1A88B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(tag: 'k', child: Icon(Icons.female_outlined)),
                      Hero(
                        tag: 'l',
                        child: Text(
                          'FEMALE',
                          style: TextStyle(
                            fontFamily: 'Bad',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 60;
  int age = 20;
  void subtract(int agee) {
    age = agee - 1;
  }

  void subtractw(int w) {
    weight = w - 1;
  }

  void addw(int w) {
    weight = w + 1;
  }

  void add(int agee) {
    age = agee + 1;
  }

  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE1A88B),
        title: Center(child: Text('BMI CALCULATOR')),
        leading: Icon(
          Icons.calculate_outlined,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Reusing(
                  cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                      tag: 'h',
                      child: Icon(
                        Icons.male_outlined,
                        size: 50,
                      )),
                  Hero(
                    tag: 'j',
                    child: Text(
                      'MALE',
                      style: TextStyle(
                        fontFamily: 'Bad',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Expanded(
              child: Reusing(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text('cm')
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.black,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Reusing(
                        cardChild: Column(
                      children: [
                        Text('WEIGHT'),
                        Text('$weight'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 55,
                              margin: EdgeInsets.all(5),
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    subtractw(weight);
                                  });
                                },
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80)),
                                child: Center(
                                    child: Icon(
                                  Icons.remove,
                                )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              width: 60.0,
                              height: 55,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    addw(weight);
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80)),
                                elevation: 20.0,
                                child: Center(child: Icon(Icons.add)),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                  ),
                  Expanded(
                    child: Reusing(
                      cardChild: Column(
                        children: [
                          Text('AGE'),
                          Text('$age'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 55,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      subtract(age);
                                    });
                                  },
                                  elevation: 20.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80)),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                  )),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 60.0,
                                height: 55,
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      add(age);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80)),
                                  elevation: 20.0,
                                  child: Center(child: Icon(Icons.add)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40.0,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  calculation c = calculation(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => result(
                                res: c.calc(),
                                value: c.getresult(),
                                ins: c.interpret(),
                              )));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 20.0,
                splashColor: Color(0xFFE1A88B),
                color: Colors.black,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Reusing extends StatelessWidget {
  final Widget cardChild;

  const Reusing({required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 2.0),
            )
          ]),
    );
  }
}

class FInputPage extends StatefulWidget {
  @override
  _FInputPageState createState() => _FInputPageState();
}

class _FInputPageState extends State<FInputPage> {
  int weight = 60;
  int age = 20;
  void subtract(int agee) {
    age = agee - 1;
  }

  void subtractw(int w) {
    weight = w - 1;
  }

  void addw(int w) {
    weight = w + 1;
  }

  void add(int agee) {
    age = agee + 1;
  }

  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE1A88B),
        title: Center(child: Text('BMI CALCULATOR')),
        leading: Icon(
          Icons.calculate_outlined,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Reusing(
                  cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                      tag: 'h',
                      child: Icon(
                        Icons.male_outlined,
                        size: 50,
                      )),
                  Hero(
                    tag: 'j',
                    child: Text(
                      'FEMALE',
                      style: TextStyle(
                        fontFamily: 'Bad',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Expanded(
              child: Reusing(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text('cm')
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.black,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Reusing(
                        cardChild: Column(
                      children: [
                        Text('WEIGHT'),
                        Text('$weight'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 55,
                              margin: EdgeInsets.all(5),
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    subtractw(weight);
                                  });
                                },
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80)),
                                child: Center(
                                    child: Icon(
                                  Icons.remove,
                                )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              width: 60.0,
                              height: 55,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    addw(weight);
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80)),
                                elevation: 20.0,
                                child: Center(child: Icon(Icons.add)),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                  ),
                  Expanded(
                    child: Reusing(
                      cardChild: Column(
                        children: [
                          Text('AGE'),
                          Text('$age'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 55,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      subtract(age);
                                    });
                                  },
                                  elevation: 20.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80)),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                  )),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 60.0,
                                height: 55,
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      add(age);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80)),
                                  elevation: 20.0,
                                  child: Center(child: Icon(Icons.add)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40.0,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  calculation c = calculation(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => result(
                                res: c.calc(),
                                value: c.getresult(),
                                ins: c.interpret(),
                              )));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 20.0,
                splashColor: Color(0xFFE1A88B),
                color: Colors.black,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class result extends StatelessWidget {
  result({required this.res, required this.value, required this.ins});
  final String res;
  final String value;
  final String ins;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE1A88B),
        title: Center(child: Text('BMI CALCULATOR')),
        leading: Icon(
          Icons.calculate_outlined,
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 60.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 2.0),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  res,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.pink,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  ins,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40.0,
            width: double.infinity,
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 20.0,
              splashColor: Color(0xFFE1A88B),
              color: Colors.black,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
