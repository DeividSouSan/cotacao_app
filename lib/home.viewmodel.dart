import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeViewModel {
  HomeViewModel({this.currencyPair = 'USD-BRL'});

  String currencyPair;
  TextEditingController realController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  Future<void> exchangeCurrency() async {
    String url = 'https://economia.awesomeapi.com.br/json/last/$currencyPair';

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> data = json.decode(response.body);
    double quote = double.parse(data[currencyPair.replaceAll('-', '')]['ask']);

    double result = double.parse(realController.text) / quote;

    resultController.text = result.toString();
  }
}
