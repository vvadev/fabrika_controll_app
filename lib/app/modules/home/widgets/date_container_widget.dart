import 'package:fabrika_controll_app/app/core/enums/order_date_type_class.dart';
import 'package:flutter/material.dart';

class DateContainerWidget extends StatelessWidget {
  final String date;
  final OrderDateType dateType;
  const DateContainerWidget(
      {Key? key, required this.date, required this.dateType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: dateType == OrderDateType.start
              ? [
                  Colors.green,
                  Colors.green.shade400,
                ]
              : dateType == OrderDateType.deadline
                  ? [
                      Colors.red,
                      Colors.red.shade400,
                    ]
                  : dateType == OrderDateType.end
                      ? [
                          Colors.purple,
                          Colors.purple.shade400,
                        ]
                      : [
                          Colors.white,
                          Colors.white,
                        ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(date, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
