import 'package:coinginner_flutter/controllers/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropwdownScreen extends StatelessWidget {
  DropwdownScreen({Key? key}) : super(key: key);
  final dropdownController = Get.put(DropdownController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hi'),
          actions: [
            Obx(() => DropdownButton<String>(
                  value: dropdownController.orderDropdownValue.value,
                  items: <String>[
                    'market_cap_desc',
                    'market_cap_asc',
                    'volume_asc',
                    'volume_desc'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) =>
                      {dropdownController.setValue(newValue!)},
                ))
          ],
        ),
        body: Obx(() => Text(
              dropdownController.orderDropdownValue.value,
            )));
  }
}
