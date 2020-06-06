import 'package:flutter/material.dart';
import 'CustomWidgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Prices'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButtonCustom(
            text: Text('Crypto Prices'),
            navigator: () {
              Navigator.pushNamed(context, '/CryptoPrice');
            },
          ),
          RaisedButtonCustom(
            text: Text('Metal Prices'),
            navigator: () {
              Navigator.pushNamed(context, '/MaterialPricePage');
            },
          ),
        ],
      ),
    );
  }
}
