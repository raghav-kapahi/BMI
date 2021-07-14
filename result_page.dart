import 'package:flutter/material.dart';
import 'calculation.dart';

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
