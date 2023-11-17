import 'package:flutter/material.dart';

class OrderCharacteristicWidget extends StatelessWidget {
  final String characteristic;
  final String characteristicValue;
  const OrderCharacteristicWidget(
      {Key? key,
      required this.characteristic,
      required this.characteristicValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          characteristic,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          characteristicValue,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
