import 'package:cotacao_app/home.page.dart';
import 'package:cotacao_app/home.viewmodel.dart';
import 'package:flutter/material.dart';

class QuoteApp extends StatelessWidget {
  QuoteApp({super.key});
  final HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(viewModel: viewModel),
    );
  }
}
