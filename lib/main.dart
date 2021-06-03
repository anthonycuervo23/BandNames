import 'package:flutter/material.dart';

//My imports
import 'package:band_names_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {'home': (_) => HomePage()},
    );
  }
}
