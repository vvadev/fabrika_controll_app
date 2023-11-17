import 'package:fabrika_controll_app/app/core/enums/order_date_type_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'date_container_widget.dart';

class DateListWidget extends StatelessWidget {
  final DateFormat dateFormat;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime deadline;
  final bool showAll;
  const DateListWidget({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.deadline,
    required this.dateFormat,
    this.showAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (endDate == DateTime(0) && deadline == DateTime(0)) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DateContainerWidget(
              date: dateFormat.format(startDate),
              dateType: OrderDateType.start),
        ],
      );
    } else if (endDate == DateTime(0) && deadline != DateTime(0)) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DateContainerWidget(
              date: dateFormat.format(startDate),
              dateType: OrderDateType.start),
          Text(
            '|',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          DateContainerWidget(
              date: dateFormat.format(deadline),
              dateType: OrderDateType.deadline),
        ],
      );
    } else if (endDate != DateTime(0) && !showAll) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DateContainerWidget(
              date: dateFormat.format(startDate),
              dateType: OrderDateType.start),
          Text(
            '|',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          DateContainerWidget(
              date: dateFormat.format(endDate), dateType: OrderDateType.end),
        ],
      );
    } else {
      if (deadline != DateTime(0)) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DateContainerWidget(
                date: dateFormat.format(startDate),
                dateType: OrderDateType.start),
            Text(
              '|',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            DateContainerWidget(
                date: dateFormat.format(deadline),
                dateType: OrderDateType.deadline),
            Text(
              '|',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            DateContainerWidget(
                date: dateFormat.format(endDate), dateType: OrderDateType.end),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DateContainerWidget(
                date: dateFormat.format(startDate),
                dateType: OrderDateType.start),
            Text(
              '|',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            DateContainerWidget(
                date: dateFormat.format(endDate), dateType: OrderDateType.end),
          ],
        );
      }
    }
  }
}
