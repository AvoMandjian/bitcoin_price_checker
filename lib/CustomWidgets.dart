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
            Icon(FontAwesomeIcons.dollarSign),
          ],
        ),
      ),
    );
  }
}

class ButtomContainer extends StatefulWidget {
  const ButtomContainer({
    Key key,
  }) : super(key: key);

  @override
  _ButtomContainerState createState() => _ButtomContainerState();
}

class _ButtomContainerState extends State<ButtomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      color: Colors.blueGrey,
      child: DropDownCustom(),
    );
  }
}

class DropDownCustom extends StatefulWidget {
  @override
  _DropDownCustomState createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  String dropdownValue = 'USD';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
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
                return newValue;
              });
            },
            items: <String>['USD', 'EURO', 'LBP', 'JPY']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
