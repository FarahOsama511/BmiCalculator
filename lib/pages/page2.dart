import 'package:flutter/material.dart';
import 'package:bmi/pages/page1.dart';

class Page2 extends StatelessWidget {
  static final route = "page2";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final double bmi = args['bmi'];
    final String bmiCategory = args['bmiCategory'];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 7, 22, 48),
            child: Padding(
              padding: EdgeInsets.only(top: 22, left: 10),
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 700),
            color: Colors.pink,
            width: double.infinity,
            height: 70,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, Page1.route);
              },
              child: Text(
                "RE CALCULATE",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 90, left: 10, right: 10),
            height: 600,
            width: 500,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 50, 50, 68),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bmiCategory,
                  style: TextStyle(
                    color:
                        bmiCategory == "OVERWEIGHT" ? Colors.red : Colors.green,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  bmi.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 70),
                Padding(
                  padding: EdgeInsets.all(35.0),
                  child: Text(
                    'You have $bmiCategory body weight. Good job!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
