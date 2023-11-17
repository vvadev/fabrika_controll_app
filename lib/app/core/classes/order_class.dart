import 'package:fabrika_controll_app/app/core/classes/customer_class.dart';
import 'package:intl/intl.dart';

import '../enums/order_status_class.dart';
import '../enums/payment_type_class.dart';

class OrderClass {
  final String orderID;
  final String name;
  String comment = '';
  int inPrice = -1;
  int sellPrice = -1;
  int count = -1;
  final DateTime startDate;
  DateTime endDate = DateTime(0);
  DateTime deadline = DateTime(0);
  PaymentType paymentType = PaymentType.non;
  String modelName = '';
  bool detailIsTransferred = false;
  bool delivery = false;
  String deliveryAddress = '';
  CustomerClass customer;
  bool u3dModelling = false;
  OrderStatus status = OrderStatus.non;

  final dateFormat = DateFormat('dd.MM.yy');

  OrderClass({
    required this.orderID,
    required this.name,
    required this.startDate,
    required this.customer,
    this.comment = '',
    this.inPrice = -1,
    this.sellPrice = -1,
    this.count = -1,
    DateTime? endDate,
    DateTime? deadline,
    this.paymentType = PaymentType.non,
    this.modelName = '',
    this.detailIsTransferred = false,
    this.delivery = false,
    this.deliveryAddress = '',
    this.u3dModelling = false,
    this.status = OrderStatus.non,
  })  : endDate = endDate ?? DateTime(0),
        deadline = deadline ?? DateTime(0);

  factory OrderClass.fromJson(Map<String, dynamic> json) {
    return OrderClass(
        orderID: json['orderID'],
        name: json['name'],
        startDate: DateTime.parse(json['startDate']),
        customer: CustomerClass.fromJson(json['customer']),
        comment: json['comment'] ?? '',
        inPrice: json['inPrice'] ?? -1,
        sellPrice: json['sellPrice'] ?? -1,
        count: json['count'] ?? -1,
        endDate: DateTime.parse(json['endDate'] ?? '1970-01-01T00:00:00Z'),
        deadline: DateTime.parse(json['deadline'] ?? '1970-01-01T00:00:00Z'),
        paymentType: PaymentType.values[json['paymentType'] ?? 3],
        modelName: json['modelName'] ?? '',
        detailIsTransferred: json['detailIsTransferred'] ?? false,
        delivery: json['delivery'] ?? false,
        deliveryAddress: json['deliveryAddress'] ?? '',
        u3dModelling: json['3d_modeling'] ?? false,
        status: OrderStatus.values[json['3d_modeling'] ?? 0]);
  }

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'name': name,
      'startDate': startDate.toIso8601String(),
      'customer': customer.toJson(),
      'comment': comment,
      'inPrice': inPrice,
      'sellPrice': sellPrice,
      'count': count,
      'endDate': endDate.toIso8601String(),
      'deadline': deadline.toIso8601String(),
      'paymentType': paymentType.index,
      'modelName': modelName,
      'detailIsTransferred': detailIsTransferred,
      'delivery': delivery,
      'deliveryAddress': deliveryAddress,
      '3d_modeling': u3dModelling,
      'status': status.index,
    };
  }
}
