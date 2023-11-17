// import 'package:fabrika_controll_app/app/core/classes/settings_class.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  // late CostCalculatorSettings costCalculatorSettings;

  RxDouble plasticCost = 1.4.obs;
  RxDouble operatorWorkCost = 300.0.obs;
  RxDouble electricityCost = 5.19.obs;
  RxDouble printerElectricity = 0.40.obs;
  RxDouble depreciation = 100.0.obs;
  RxDouble depreciationStartMass = 400.0.obs;
  RxDouble printerCost = 25000.0.obs;
  RxDouble printerDepreciationTime = 1440.0.obs;
  RxDouble tax = 6.0.obs;
  RxDouble paymentSystemTax = 0.0.obs;
  RxDouble premiumToTheCost = 50.0.obs;

  void saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('plasticCost', plasticCost.value);
    prefs.setDouble('operatorWorkCost', operatorWorkCost.value);
    prefs.setDouble('electricityCost', electricityCost.value);
    prefs.setDouble('printerElectricity', printerElectricity.value);
    prefs.setDouble('depreciation', depreciation.value);
    prefs.setDouble('depreciationStartMass', depreciationStartMass.value);
    prefs.setDouble('printerCost', printerCost.value);
    prefs.setDouble('printerDepreciationTime', printerDepreciationTime.value);
    prefs.setDouble('tax', tax.value);
    prefs.setDouble('paymentSystemTax', paymentSystemTax.value);
    prefs.setDouble('premiumToTheCost', premiumToTheCost.value);
  }

  void loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    plasticCost.value = prefs.getDouble('plasticCost') ?? 1.4;
    operatorWorkCost.value = prefs.getDouble('operatorWorkCost') ?? 300;
    electricityCost.value = prefs.getDouble('electricityCost') ?? 5.19;
    printerElectricity.value = prefs.getDouble('printerElectricity') ?? 0.40;
    depreciation.value = prefs.getDouble('depreciation') ?? 100;
    depreciationStartMass.value =
        prefs.getDouble('depreciationStartMass') ?? 400;
    printerCost.value = prefs.getDouble('printerCost') ?? 25000;
    printerDepreciationTime.value =
        prefs.getDouble('printerDepreciationTime') ?? 1440;
    tax.value = prefs.getDouble('tax') ?? 6;
    paymentSystemTax.value = prefs.getDouble('paymentSystemTax') ?? 0;
    premiumToTheCost.value = prefs.getDouble('premiumToTheCost') ?? 50;
  }

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
