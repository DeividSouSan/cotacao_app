import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeViewModel {
  HomeViewModel({this.currencyPair = 'USD-BRL'});

  String currencyPair;

  Future<double> exchangeCurrency(double value) async {
    String url = 'https://economia.awesomeapi.com.br/json/last/$currencyPair';

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> data = json.decode(response.body);
    double quote = double.parse(data[currencyPair.replaceAll('-', '')]['ask']);

    return value / quote;
  }
}
