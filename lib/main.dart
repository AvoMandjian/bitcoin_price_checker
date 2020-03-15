import 'package:flutter/material.dart';
import 'crypto-price-screen.dart';
import 'loadingScreen.dart';
import 'material-price-screen.dart';
import 'home-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/CryptoPrice': (context) => CryptoPrice(),
        '/MaterialPricePage': (context) => MaterialPricePage(),
        '/loadingScreen': (context) => LoadingScreen(),
      },
    );
  }
}
