import 'package:flutter/material.dart';

enum OrderStatus {
  non,
  accepted,
  inDevelopment,
  inPrint,
  hasBeenSent,
  completed,
}

extension OrderStatusExtension on OrderStatus {
  String get name {
    switch (this) {
      case OrderStatus.accepted:
        return 'Принят';
      case OrderStatus.inDevelopment:
        return 'В разработке';
      case OrderStatus.inPrint:
        return 'В печати';
      case OrderStatus.hasBeenSent:
        return 'Отправлен';
      case OrderStatus.completed:
        return 'Завершен';
      default:
        return 'Не определен';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.accepted:
        return Colors.brown;
      case OrderStatus.inDevelopment:
        return Colors.green;
      case OrderStatus.inPrint:
        return Colors.green;
      case OrderStatus.hasBeenSent:
        return Colors.orange;
      case OrderStatus.completed:
        return Colors.purple;
      default:
        return Colors.black;
    }
  }
}
