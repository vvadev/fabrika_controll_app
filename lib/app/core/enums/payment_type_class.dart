enum PaymentType { cash, transfer, other, non }

extension PaymentTypeExtension on PaymentType {
  String get name {
    switch (this) {
      case PaymentType.cash:
        return 'Наличные';
      case PaymentType.transfer:
        return 'Перевод';
      case PaymentType.other:
        return 'Иное';
      default:
        return 'Не определен';
    }
  }
}
