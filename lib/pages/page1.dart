import 'package:bmi/main.dart';
import 'package:bmi/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp()) {}
}

class Page1 extends StatefulWidget {
  static final route = 'page1';

  @override
  Page createState() => Page();
}

class Page extends State<Page1> {
  double currentvalue = 0;
  int? selectIndex;
  int WEIGHT = 63;
  int AGE = 25;
  double calculateBMI() {
    double heightInMeters = currentvalue / 100;
    return WEIGHT / (heightInMeters * heightInMeters);
  }

  String getCalulatebmi(double bmi) {
    if (bmi >= 25) {
      return 'OVER WEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 7, 22, 48),
      ),
      body: Container(
        color: Color.fromARGB(255, 7, 22, 48),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  MaterialButton(
                    color: selectIndex == 0
                        ? Color.fromARGB(255, 50, 50, 68)
                        : Color.fromARGB(255, 29, 33, 54),
                    height: 180,
                    minWidth: 175,
                    onPressed: () {
                      setState(() {
                        selectIndex = 0;
                      });
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male, size: 65, color: Colors.white),
                        Text(
                          "MALE",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 140, 139, 139),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  MaterialButton(
                    color: selectIndex == 1
                        ? Color.fromARGB(255, 50, 50, 68)
                        : Color.fromARGB(255, 29, 33, 54),
                    height: 180,
                    minWidth: 175,
                    onPressed: () {
                      setState(() {
                        selectIndex = 1;
                      });
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female, size: 65, color: Colors.white),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 146, 145, 145),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 50, 50, 68),
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 146, 145, 145),
                      ),
                    ),
                    Text('${currentvalue.toStringAsFixed(1)}cm',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Slider(
                      value: currentvalue,
                      min: 0.0,
                      max: 200.0,
                      divisions: 4,
                      activeColor: Colors.pink,
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          currentvalue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 180,
                    height: 190,
                    color: Color.fromARGB(255, 50, 50, 68),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 140, 139, 139),
                          ),
                        ),
                        Text(
                          "${WEIGHT.toString()}",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (WEIGHT > 0) WEIGHT--;
                                });
                              },
                              child: Icon(
                                Icons.minimize,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  WEIGHT++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                    width: 170,
                    height: 190,
                    color: Color.fromARGB(255, 50, 50, 68),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 140, 139, 139),
                          ),
                        ),
                        Text(
                          "${AGE.toString()}",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (AGE > 0) AGE--;
                                });
                              },
                              child: Icon(
                                Icons.minimize,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  AGE++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.pink,
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  double bmi = calculateBMI();
                  String bmiCategory = getCalulatebmi(bmi);
                  Navigator.pushNamed(context, Page2.route,
                      arguments: {'bmi': bmi, 'bmiCategory': bmiCategory});
                },
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
