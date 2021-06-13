import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto_price/screens/home_screen.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Price API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.tealAccent,
      ),
      home: HomeScreen(),
    );
  }
}
