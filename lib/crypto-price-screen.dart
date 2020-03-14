import 'package:bitcoin_price_checker/GetPrice.dart';
import 'package:flutter/material.dart';

import 'CustomWidgets.dart';

class CryptoPrice extends StatefulWidget {
  @override
  _CryptoPriceState createState() => _CryptoPriceState();
}

class _CryptoPriceState extends State<CryptoPrice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Prices'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: CardCustom(
              text: 'BTC price}',
            ),
          ),
          Expanded(
            child: CardCustom(
              text: 'ETH price',
            ),
          ),
          Expanded(
            child: CardCustom(
              text: 'LTC price',
            ),
          ),
          ButtomContainer(),
        ],
      ),
    );
  }
}
