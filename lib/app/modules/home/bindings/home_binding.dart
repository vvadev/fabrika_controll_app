import 'package:get/get.dart';

import 'package:fabrika_controll_app/app/modules/home/controllers/page_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageHomeController>(
      () => PageHomeController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
