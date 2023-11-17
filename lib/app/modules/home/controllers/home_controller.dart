import 'package:fabrika_controll_app/app/core/classes/customer_class.dart';
import 'package:fabrika_controll_app/app/core/classes/order_class.dart';
import 'package:fabrika_controll_app/app/core/enums/order_status_class.dart';
import 'package:fabrika_controll_app/app/core/enums/payment_type_class.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<OrderClass> orders = [
    OrderClass(
        orderID: '65255bb9c8a2a62b2562',
        name: 'name',
        startDate: DateTime.now(),
        endDate: DateTime(2023, 11, 1),
        deadline: DateTime(2023, 10, 31),
        customer: CustomerClass(name: 'name', customerID: '12345678'),
        comment:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        count: 4,
        inPrice: 123,
        sellPrice: 125,
        paymentType: PaymentType.cash,
        modelName: 'model name',
        detailIsTransferred: true,
        delivery: true,
        deliveryAddress: 'deliveryAddress',
        status: OrderStatus.inPrint),
    OrderClass(
      orderID: '12345678',
      name: 'name',
      startDate: DateTime.now(),
      customer: CustomerClass(name: 'name', customerID: '12345678'),
      comment: 'comment',
      count: 4,
      inPrice: 123,
      sellPrice: 125,
      paymentType: PaymentType.cash,
      modelName: 'model name',
      detailIsTransferred: true,
      delivery: true,
      deliveryAddress: 'deliveryAddress',
      status: OrderStatus.accepted,
    ),
    OrderClass(
      orderID: '12345678',
      name: 'name',
      startDate: DateTime.now(),
      customer: CustomerClass(name: 'name', customerID: '12345678'),
      comment: 'comment',
      count: 4,
      inPrice: 123,
      sellPrice: 125,
      paymentType: PaymentType.cash,
      modelName: 'model name',
      detailIsTransferred: true,
      delivery: true,
      deliveryAddress: 'deliveryAddress',
      status: OrderStatus.accepted,
    ),
  ];
}
