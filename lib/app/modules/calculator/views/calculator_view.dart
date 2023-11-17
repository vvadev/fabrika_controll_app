import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/calculator_controller.dart';

class CalculatorView extends GetView<CalculatorController> {
  final Function(double)? onCalculate;

  final calculatorController = Get.put(CalculatorController());

  CalculatorView({Key? key, this.onCalculate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Калькулятор стоимости'),
            actions: onCalculate != null
                ? [
                    IconButton(
                      onPressed: () {
                        if (calculatorController.sellPrice > 0) {
                          onCalculate!(calculatorController.sellPrice);
                        } else {
                          Get.snackbar(
                              'Ошибка', 'Стоимость не может быть равна 0');
                        }
                      },
                      icon: const Icon(LineIcons.checkCircle),
                    )
                  ]
                : [],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      TextField(
                        controller: calculatorController.massController,
                        decoration: const InputDecoration(
                          labelText: 'Вес модели (г.)',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            calculatorController.calculatePrice(),
                        onTapOutside: (event) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: calculatorController.printTimeController,
                        decoration: const InputDecoration(
                          labelText: 'Время печати модели (мин.)',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            calculatorController.calculatePrice(),
                        onTapOutside: (event) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller:
                            calculatorController.operatorWorkTimeController,
                        decoration: const InputDecoration(
                          labelText: 'Время работы оператора (мин.)',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            calculatorController.calculatePrice(),
                        onTapOutside: (event) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      const Divider(),
                      Text(
                        'Статические параметры',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      _ParameterWidget(
                          title: 'Стоимость 1 г. пластика',
                          value: calculatorController.plasticCost
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Стоимость часа работы оператора',
                          value: calculatorController.operatorWorkCost
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Стоимость 1 кв. электричества',
                          value: calculatorController.electricityCost
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Потребление принтера в час',
                          value: calculatorController.printerElectricity
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Амортизация руб.',
                          value: calculatorController.depreciation
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Масса от которой считается амортизация',
                          value: calculatorController.depreciationStartMass
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Стоимость принтера',
                          value: calculatorController.printerCost
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Время окупаемости принтера час.',
                          value: calculatorController.printerDepreciationTime
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Налог государства',
                          value: '${calculatorController.tax}%'),
                      _ParameterWidget(
                          title: 'Комиссия платежной системы',
                          value: calculatorController.paymentSystemTax
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Наценка',
                          value: calculatorController.premiumToTheCost
                              .toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
              KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      bottom: isKeyboardVisible ? 8 : 80, left: 8, right: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Итоговая стоимость',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      _ParameterWidget(
                          title: 'Стоимость пластика:',
                          value: calculatorController.plasticPrice
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Компенсация оборудования:',
                          value: calculatorController.equipmentCompensationPrice
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Себестоимость:',
                          value: calculatorController.costPrice
                              .toStringAsFixed(2)),
                      _ParameterWidget(
                          title: 'Наценка:',
                          value: calculatorController.extraCharge
                              .toStringAsFixed(2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Стоимость продажи:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            calculatorController.sellPrice.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _ParameterWidget extends StatelessWidget {
  const _ParameterWidget({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 3,
          ),
        ),
        Text(
          value,
        ),
      ],
    );
  }
}
