import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final controller = Get.put(SettingsController());

  SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки приложения'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Divider(),
                Text(
                  'Статические параметры калькулятора',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSettingItem('Plastic Cost', controller.plasticCost),
                    buildSettingItem(
                        'Operator Work Cost', controller.operatorWorkCost),
                    buildSettingItem(
                        'Electricity Cost', controller.electricityCost),
                    buildSettingItem(
                        'Printer Electricity', controller.printerElectricity),
                    buildSettingItem('Depreciation', controller.depreciation),
                    buildSettingItem('Depreciation Start Mass',
                        controller.depreciationStartMass),
                    buildSettingItem('Printer Cost', controller.printerCost),
                    buildSettingItem('Printer Depreciation Time',
                        controller.printerDepreciationTime),
                    buildSettingItem('Tax', controller.tax),
                    buildSettingItem(
                        'Payment System Tax', controller.paymentSystemTax),
                    buildSettingItem(
                        'Premium To The Cost', controller.premiumToTheCost),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        controller.saveSettings();
                        Get.snackbar(
                            'Сохранено', 'Настройки сохранены успешно');
                      },
                      child: Text('Сохранить'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
            return Positioned(
              right: 8,
              bottom: isKeyboardVisible ? 16 : 80,
              child: FloatingActionButton(
                onPressed: () {
                  controller.saveSettings();
                  Get.snackbar('Сохранено',
                      'Настройки сохранены успешно, для их применения необходимо перезапустить приложение');
                },
                child: const Icon(Icons.save),
              ),
            );
          }),
        ],
      ),
    );
  }
}

Widget buildSettingItem(String label, RxDouble value) {
  return Builder(builder: (context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.number,
        onChanged: (text) => value.value = double.parse(text),
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        initialValue: value.value.toString(),
      ),
    );
  });
}
