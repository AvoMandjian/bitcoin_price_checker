import 'package:flutter/material.dart';

import 'CustomWidgets.dart';

class MaterialPricePage extends StatelessWidget {
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
              text: 'Gold price',
            ),
          ),
          Expanded(
            child: CardCustom(
              text: 'Siver price',
            ),
          ),
          Expanded(
            child: CardCustom(
              text: 'Iron price',
            ),
          ),
        ],
      ),
    );
  }
}
