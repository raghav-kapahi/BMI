import 'package:body_mass_index/female_input.dart';
import 'package:body_mass_index/input_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'female_input.dart';
import 'calculation.dart';

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
