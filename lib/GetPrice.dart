// https://blockchain.info/ticker
// var btcPrice = jsonResponse['USD']['buy'];
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetPrice {
  var url = 'https://blockchain.info/ticker';

  Future data() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return json;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
