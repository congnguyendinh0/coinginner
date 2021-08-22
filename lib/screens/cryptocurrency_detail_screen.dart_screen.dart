import 'package:flutter/material.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';

class CoinDetailScreen extends StatelessWidget {
  final Cryptocurrency cryptocurrency;
  const CoinDetailScreen({Key? key, required this.cryptocurrency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cryptocurrency.name)),
    );
  }
}
