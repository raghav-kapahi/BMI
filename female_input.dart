import 'package:flutter/material.dart';
import 'result_page.dart';
import 'calculation.dart';

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
