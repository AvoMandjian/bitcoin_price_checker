import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RaisedButtonCustom extends StatelessWidget {
  RaisedButtonCustom({this.text, this.navigator});
  final Widget text;
  final Function navigator;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: text,
      onPressed: navigator,
    );
  }
}

class CardCustom extends StatelessWidget {
  const CardCustom({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
