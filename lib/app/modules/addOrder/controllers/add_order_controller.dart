// import 'package:fabrika_controll_app/app/core/classes/customer_class.dart';
// import 'package:fabrika_controll_app/app/core/classes/order_class.dart';
// import 'package:fabrika_controll_app/app/core/classes/order_status_class.dart';
// import 'package:fabrika_controll_app/app/core/classes/payment_type_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderController extends GetxController {
  String selectedCustomer =
      'не выбран'; // Исходное значение переменной selectedCustomer
  TextEditingController orderNameController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController inPriceController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController countController = TextEditingController();
  bool u3dModelling = false; // Исходное значение переменной u3dModelling
  String selectedPaymentType =
      'Наличные'; // Исходное значение переменной selectedPaymentType
  String selectedStatus =
      'Принят'; // Исходное значение переменной selectedStatus

  @override
  void onInit() {
    super.onInit();
  }

  // Создаем set-функции для каждой переменной
  void setSelectedCustomer(String customer) {
    selectedCustomer = customer;
    update();
  }

  void setOrderName(String name) {
    orderNameController.text = name;
    update();
  }

  void setComment(String comment) {
    commentController.text = comment;
    update();
  }

  void setInPrice(String price) {
    inPriceController.text = price;
    update();
  }

  void setSellPrice(String price) {
    sellPriceController.text = price;
    update();
  }

  void setCount(String count) {
    countController.text = count;
    update();
  }

  void setU3DModelling(bool value) {
    u3dModelling = value;
    update();
  }

  void setSelectedPaymentType(String paymentType) {
    selectedPaymentType = paymentType;
    update();
  }

  void setSelectedStatus(String status) {
    selectedStatus = status;
    update();
  }

  Future<void> createOrder() async {
    // Создание объекта OrderClass с использованием значений переменных
    // final newOrder = OrderClass(
    //   orderID: '123',
    //   name: orderNameController.text,
    //   startDate: DateTime.now(),
    //   customer: CustomerClass(name: selectedCustomer, customerID: '123'),
    //   comment: commentController.text,
    //   inPrice: int.tryParse(inPriceController.text) ?? -1,
    //   sellPrice: int.tryParse(sellPriceController.text) ?? -1,
    //   count: int.tryParse(countController.text) ?? -1,
    //   u3dModelling: u3dModelling,
    //   paymentType: PaymentType.values.firstWhere(
    //     (type) => type.name == selectedPaymentType,
    //     orElse: () => PaymentType.non,
    //   ),
    //   status: OrderStatus.values.firstWhere(
    //     (status) => status.name == selectedStatus,
    //     orElse: () => OrderStatus.non,
    //   ),
    // );
    // print(newOrder);
  }
}
