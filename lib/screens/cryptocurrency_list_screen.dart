import 'package:coinginner_flutter/controllers/dropdown_controller.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
import 'package:flutter/material.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:get/get.dart';

import '../services/http_coin_service.dart';

class CoinScreen extends StatelessWidget {
  CoinScreen({Key? key}) : super(key: key);
  final dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(dropdownController.orderDropdownValue.value),
            actions: [
              DropdownButton<String>(
                value: dropdownController.orderDropdownValue.value,
                items: <String>[
                  'market_cap_asc',
                  'market_cap_desc',
                  'volume_asc',
                  'volume_desc'
                ].map<DropdownMenuItem<String>>((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (order) => dropdownController.setValue(order!),
              )
            ],
          ),
          body: FutureBuilder(
            future: CoinService.getCryptocurrencyList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Cryptocurrency>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    var cryptoCurrencyList = snapshot.data;
                    if (cryptoCurrencyList is List<Cryptocurrency>) {
                      return ListView.builder(
                          itemCount: cryptoCurrencyList.length,
                          itemBuilder: (BuildContext itemContext, int index) {
                            Cryptocurrency cryptocurrency =
                                cryptoCurrencyList[index];

                            return Card(
                                child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        foregroundImage:
                                            NetworkImage(cryptocurrency.image),
                                        backgroundColor: Colors.pink,
                                      ),
                                      title: Center(
                                        child: Text(cryptocurrency.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      onTap: () {
                                        //without getx
                                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoinDetailScreen(cryptocurrency: cryptoCurrencyList[index],)));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CoinDetailScreen(
                                                      cryptocurrency:
                                                          cryptoCurrencyList[
                                                              index])),
                                        );
                                      },
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: ListTile(
                                      title: Text(
                                        cryptocurrency.currentPrice
                                            .toStringAsFixed(2),
                                        maxLines: 1,
                                      ),
                                      subtitle: Text(
                                        cryptocurrency.priceChangePercentage24h
                                                .toStringAsFixed(2) +
                                            " %",
                                      ),
                                    ))
                              ]),
                            ));
                          });
                    }
                  }
                  break;
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.none:
                  return Text("Error");
                default:
                  return Text("Error");
              }

              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
