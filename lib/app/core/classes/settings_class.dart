// class SettingsController extends GetxController {
//   var globalSettings = GlobalSettings().obs;
//   var orderScreenSettings = OrderScreenSettings().obs;
//   var costCalculatorSettings = CostCalculatorSettings().obs;

//   static SettingsController get to => Get.find<SettingsController>();
// }

class GlobalSettings {
  bool darkMode;
  String language;

  GlobalSettings({
    this.darkMode = false,
    this.language = 'ru_RU',
  });
}

// class OrderScreenSettings {
//   bool showCompletedOrders;
//   bool notifyNewOrders;

//   OrderScreenSettings({
//     this.showCompletedOrders = true,
//     this.notifyNewOrders = true,
//   });
// }

class CostCalculatorSettings {
  final int depreciation; // Амортизация за 100г (руб)
  final int depreciationFrom; // Масса от которой считать амортизацию (г)
  final int
      costOfAnHourOfPrinterOperation; // Стоимость часа работы принтера (руб)
  final int timeToStartPrinting; // Время на запуск печати (мин)
  final int timeToStopPrinting; // Время на остановку печати (мин)
  final int costOfAnHourOfOperatorWork; // Стоимость часа работы оператора (руб)
  final int costOfElectricity; // Стоимость электричества (за КВт)
  final int
      printerElectricityConsumption; // Потребление электричества принтером (час)
  final int stateTax; // Налог государства (%)
  final int paymentSystemCommission; // Комиссия платежной системы (%)
  final int costSurcharge;

  CostCalculatorSettings({
    required this.depreciation,
    required this.depreciationFrom,
    required this.costOfAnHourOfPrinterOperation,
    required this.timeToStartPrinting,
    required this.timeToStopPrinting,
    required this.costOfAnHourOfOperatorWork,
    required this.costOfElectricity,
    required this.printerElectricityConsumption,
    required this.stateTax,
    required this.paymentSystemCommission,
    required this.costSurcharge,
  });
}
