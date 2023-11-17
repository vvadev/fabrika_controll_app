import 'package:fabrika_controll_app/app/modules/calculator/views/calculator_view.dart';
import 'package:fabrika_controll_app/app/modules/home/views/layout_view.dart';
import 'package:fabrika_controll_app/app/modules/home/widgets/order_container_widget.dart';
import 'package:fabrika_controll_app/app/modules/settings/views/settings_view.dart';
import 'package:fabrika_controll_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authController = Get.put(AuthController());

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        return LayoutView(
          children: [
            CalculatorView(),
            Scaffold(
              appBar: AppBar(
                title: const Text('Заказы'),
                actions: [
                  IconButton(
                      onPressed: () => authController.deleteSession(),
                      icon: const Icon(Icons.exit_to_app))
                ],
              ),
              body: Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    itemCount: homeController.orders.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(
                          bottom: index == homeController.orders.length - 1
                              ? 80
                              : 0),
                      child: OrderContainerWidget(
                        order: homeController.orders[index],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 80,
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.toNamed(Routes.ADD_ORDER);
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            SettingsView(),
          ],
        );
      },
    );
  }
}
