import 'package:fabrika_controll_app/app/core/classes/order_class.dart';
import 'package:fabrika_controll_app/app/core/enums/payment_type_class.dart';
import 'package:fabrika_controll_app/app/core/enums/order_status_class.dart';
import 'package:fabrika_controll_app/app/modules/home/widgets/date_list_widget.dart';
import 'package:fabrika_controll_app/app/modules/home/widgets/order_characteristic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tab_container/tab_container.dart';

class OrderContainerWidget extends StatefulWidget {
  final OrderClass order;
  const OrderContainerWidget({Key? key, required this.order}) : super(key: key);

  @override
  _OrderContainerWidgetState createState() => _OrderContainerWidgetState();
}

class _OrderContainerWidgetState extends State<OrderContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AspectRatio(
        aspectRatio: 10 / 8,
        child: TabContainer(
          controller: TabContainerController(length: 2, initialIndex: 0),
          tabEdge: TabEdge.right,
          isStringTabs: false,
          colors: const [
            Colors.blue,
            Color.fromARGB(255, 101, 0, 205),
          ],
          tabs: const [
            Icon(LineIcons.infoCircle),
            Icon(
              LineIcons.horizontalEllipsis,
            ),
          ],
          children: [_Tab1(order: order), _Tab2(order: order)],
        ),
      ),
    );
  }
}

class _Tab2 extends StatelessWidget {
  const _Tab2({
    super.key,
    required this.order,
  });

  final OrderClass order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID заказа:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    order.orderID,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IconButton.filled(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.purple.shade900)),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: order.orderID));
                      Get.snackbar(
                        'Скопированно',
                        'ID заказа скопирован в буфер обмена',
                      );
                    },
                    icon: const Icon(
                      LineIcons.copy,
                    ),
                  ),
                ],
              )
            ],
          ),
          OrderCharacteristicWidget(
              characteristic: 'Тип оплаты:',
              characteristicValue: order.paymentType.name),
          OrderCharacteristicWidget(
              characteristic: 'Исходная деталь:',
              characteristicValue:
                  order.detailIsTransferred ? 'Передана' : 'Не передана'),
          const Divider(
            color: Colors.white,
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    'Комментарий',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    order.comment,
                    maxLines: null,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Tab1 extends StatelessWidget {
  const _Tab1({
    required this.order,
  });

  final OrderClass order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        order.name,
                        style: Theme.of(context).textTheme.headlineLarge,
                        maxLines: 2,
                      ),
                      OrderCharacteristicWidget(
                          characteristic: 'Количество:',
                          characteristicValue: '${order.count}'),
                      OrderCharacteristicWidget(
                          characteristic: 'Себестоимость:',
                          characteristicValue: '${order.inPrice}'),
                      OrderCharacteristicWidget(
                          characteristic: 'Цена продажи:',
                          characteristicValue: '${order.sellPrice}'),
                      OrderCharacteristicWidget(
                          characteristic: 'Доставка:',
                          characteristicValue: order.delivery ? 'есть' : 'нет'),
                      OrderCharacteristicWidget(
                          characteristic: '3D:',
                          characteristicValue:
                              order.u3dModelling ? 'есть' : 'нет'),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: DateListWidget(
                    startDate: order.startDate,
                    endDate: order.endDate,
                    deadline: order.deadline,
                    dateFormat: order.dateFormat,
                    showAll: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Статус заказа:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: order.status.color,
                ),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(order.status.name,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ],
          )
        ],
      ),
    );
  }
}
