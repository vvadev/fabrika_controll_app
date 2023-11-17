import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorController extends GetxController {
  TextEditingController massController = TextEditingController();
  TextEditingController printTimeController = TextEditingController();
  TextEditingController operatorWorkTimeController =
      TextEditingController(text: '0');

  // выводимые значения
  double sellPrice = 0; // стоимость продажи
  double costPrice = 0; // себестоимость
  double plasticPrice = 0; // стоимость пластика
  double equipmentCompensationPrice = 0; // компенсация оборудования
  double extraCharge = 0; // наценка

  // статические значения
  double plasticCost = 1.4;
  double operatorWorkCost = 300;
  double electricityCost = 5.19;
  double printerElectricity = 0.40;
  double depreciation = 100;
  double depreciationStartMass = 400;
  double printerCost = 25000;
  double printerDepreciationTime = 1440;
  double tax = 6;
  double paymentSystemTax = 0;
  double premiumToTheCost = 50;

  void calculatePrice() {
    try {
      final mass = double.parse(massController.value.text);
      final time = double.parse(printTimeController.value.text);
      final oper = double.parse(operatorWorkTimeController.value.text);
      final plCost = mass * plasticCost;
      final elCost = (printerElectricity / 60) * time * electricityCost;
      final operCost = time * (oper / 60);
      final deprec =
          mass > depreciationStartMass ? mass / 100 * depreciation : 0;
      final printerDeprec = (printerCost / printerDepreciationTime) / 60 * time;

      print(deprec);

      costPrice = plCost + elCost + operCost + deprec + printerDeprec;

      sellPrice = costPrice / (1 - (premiumToTheCost / 100));
      extraCharge = sellPrice - costPrice;
      sellPrice = sellPrice / (1 - ((tax + paymentSystemTax) / 100));

      equipmentCompensationPrice = printerDeprec;
      plasticPrice = plCost;

      update();
    } catch (e) {
      sellPrice = 0;
      extraCharge = 0;
      equipmentCompensationPrice = 0;
      plasticPrice = 0;
      costPrice = 0;
      update();
    }
  }

  void getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    plasticCost = prefs.getDouble('plasticCost') ?? 1.4;
    operatorWorkCost = prefs.getDouble('operatorWorkCost') ?? 300;
    electricityCost = prefs.getDouble('electricityCost') ?? 5.19;
    printerElectricity = prefs.getDouble('printerElectricity') ?? 0.40;
    depreciation = prefs.getDouble('depreciation') ?? 100;
    depreciationStartMass = prefs.getDouble('depreciationStartMass') ?? 400;
    printerCost = prefs.getDouble('printerCost') ?? 25000;
    printerDepreciationTime =
        prefs.getDouble('printerDepreciationTime') ?? 1440;
    tax = prefs.getDouble('tax') ?? 6;
    paymentSystemTax = prefs.getDouble('paymentSystemTax') ?? 0;
    premiumToTheCost = prefs.getDouble('premiumToTheCost') ?? 50;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getSettings();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    massController.dispose();
    printTimeController.dispose();
    operatorWorkTimeController.dispose();
  }
}
