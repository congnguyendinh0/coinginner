import 'package:coinginner_flutter/services/http_coin_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:coinginner_flutter/models/news.dart';
import 'package:dio/dio.dart';
import './services/http_news_service.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';

void main() {
  CoinService.getCryptocurrencyList()
      .then((coins) => coins.forEach((coin) {
            print(coin.name);
          }))
      .catchError((error) {
    print(error);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coinginner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //home: const MyHomePage(title: 'Coinginner'),
      home: const NewsScreen(),
    );
  }
}
