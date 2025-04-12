import 'package:cotacao_app/home.viewmodel.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversão')),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              controller: widget.viewModel.realController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Reais",
                border: OutlineInputBorder(),
              ),
            ),
            DropdownMenu(
              initialSelection: widget.viewModel.currencyPair,
              onSelected: (value) => {widget.viewModel.currencyPair = value!},
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'USD-BRL', label: 'Dólar'),
                DropdownMenuEntry(value: 'EUR-BRL', label: 'Euro'),
                DropdownMenuEntry(value: 'BTC-BRL', label: 'Bitcoin'),
              ],
            ),
            ElevatedButton(
              onPressed: widget.viewModel.exchangeCurrency,
              child: Text("Converter"),
            ),
            TextField(
              controller: widget.viewModel.resultController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Resultado",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
