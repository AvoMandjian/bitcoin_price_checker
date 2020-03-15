import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'CustomWidgets.dart';

class CryptoPrice extends StatefulWidget {
  @override
  _CryptoPriceState createState() => _CryptoPriceState();
}

class _CryptoPriceState extends State<CryptoPrice> {
  String url =
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,EUR,JPY,LBP,AMD&api_key=902c1a8bb7583958c33e91f267157417945f5714fd885d5c89584022ac9697e4';
  var data;
  double priceBTC = 0;
  double priceETH = 0;
  double priceLTC = 0;
  List allData = [0, 0, 0];
  String currency = 'USD';
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    http.Response response = await http.get(url);
    setState(() {
      data = json.decode(response.body);
      priceBTC = data['BTC'][currency];
      priceETH = data['ETH'][currency];
      priceLTC = data['LTC'][currency];

      allData = [priceBTC, priceETH, priceLTC];
    });
    return allData;
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
              text: 'BTC price is ${allData[0]}',
            ),
          ),
          Expanded(
            child: CardCustom(
              text: 'ETH price is ${allData[1]}',
            ),
          ),
          Expanded(
            child: CardCustom(
              text: 'LTC price is ${allData[2]}',
            ),
          ),
          ButtomContainer(),
        ],
      ),
    );
  }
}
