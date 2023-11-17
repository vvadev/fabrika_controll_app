import 'package:fabrika_controll_app/app/core/enums/order_status_class.dart';
import 'package:fabrika_controll_app/app/core/enums/payment_type_class.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_order_controller.dart';

class AddOrderView extends GetView<AddOrderController> {
  const AddOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderController>(
        init: AddOrderController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Создать заказ'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Заказчик:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      DropdownButton(
                        value: controller.selectedCustomer,
                        items: const [
                          DropdownMenuItem(
                            value: 'не выбран',
                            child: Text('не выбран'),
                          )
                        ],
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedCustomer = newValue;
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Название заказа',
                    ),
                    controller: controller.orderNameController,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: controller.commentController,
                    decoration: const InputDecoration(
                      labelText: 'Комментарий',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: controller.inPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Цена закупки',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: controller.sellPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Цена продажи',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: controller.countController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Количество',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '3D Моделирование:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Checkbox(
                        value: controller.u3dModelling,
                        onChanged: (value) {
                          controller.u3dModelling = value!;
                          controller.setU3DModelling(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Тип оплаты:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      DropdownButton<String>(
                        value: controller.selectedPaymentType,
                        items: PaymentType.values.map((type) {
                          return DropdownMenuItem<String>(
                            value: type.name,
                            child: Text(type.name),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSelectedPaymentType(newValue);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Статус заказа:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      DropdownButton<String>(
                        value: controller.selectedStatus,
                        items: OrderStatus.values.map((status) {
                          return DropdownMenuItem<String>(
                            value: status.name,
                            child: Text(status.name),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSelectedStatus(newValue);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
