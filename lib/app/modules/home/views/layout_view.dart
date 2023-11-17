import 'package:fabrika_controll_app/app/modules/home/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'package:get/get.dart';

class LayoutView extends GetView {
  final pageController = Get.put(PageHomeController());

  final List<Widget> children;

  LayoutView({Key? key, required this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageHomeController>(
      builder: (context) {
        return Scaffold(
          // appBar: AppBar(
          //   title: const Text('Заказы'),
          //   // actions: [
          //   //   IconButton(
          //   //       onPressed: () => authController.deleteSession(),
          //   //       icon: const Icon(Icons.exit_to_app))
          //   // ],
          // ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Get.toNamed(Routes.ADD_ORDER);
          //   },
          //   child: const Icon(Icons.add),
          // ),
          extendBody: true,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            allowImplicitScrolling: false,
            controller: pageController.pageController,
            children: children,
          ),
          bottomNavigationBar: SnakeNavigationBar.color(
            snakeShape: SnakeShape.circle,
            padding:
                const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            showSelectedLabels: false,
            currentIndex: pageController.selectedPage,
            onTap: (value) {
              pageController.changePage(value);
            },
            items: pageController.items,
          ),
        );
      },
    );
  }
}
