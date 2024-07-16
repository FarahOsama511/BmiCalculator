import 'package:bmi/pages/page1.dart';
import 'package:bmi/pages/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Page1.route,
      routes: {
        Page1.route: (context) => Page1(),
        Page2.route: (context) => Page2(),
      },
    );
  }
}
