import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'CustomWidgets.dart';

class CryptoPrice extends StatefulWidget {
  @override
  _CryptoPriceState createState() => _CryptoPriceState();
}

class _CryptoPriceState extends State<CryptoPrice> {
  String dropdownValue = 'USD';

  // To show Selected Item in Text.
  String holder = 'USD';

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
      return holder;
    });
    getData();
  }

  String url =
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,EUR,JPY,LBP,AMD&api_key=902c1a8bb7583958c33e91f267157417945f5714fd885d5c89584022ac9697e4';
  var data;
  double priceBTC = 0;
  double priceETH = 0;
  double priceLTC = 0;
  List allData = [0, 0, 0];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    http.Response response = await http.get(url);
    setState(() {
      data = json.decode(response.body);
      priceBTC = data['BTC']['$holder'];
      priceETH = data['ETH']['$holder'];
      priceLTC = data['LTC']['$holder'];

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
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(FontAwesomeIcons.moneyBill),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['USD', 'EUR', 'LBP', 'JPY', 'AMD']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  RaisedButton(
                    child: Text('Update $holder'),
                    onPressed: getDropDownItem,
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
