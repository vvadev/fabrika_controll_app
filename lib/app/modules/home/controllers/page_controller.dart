import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHomeController extends GetxController {
  final items = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.calculate_outlined), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'home'),
  ];

  int selectedPage = 1;

  void changePage(int value) {
    pageController.animateToPage(
      value,
      duration:
          Duration(milliseconds: ((selectedPage - value).abs() + 2) * 150),
      curve: Curves.easeIn,
    );
    selectedPage = value;
    update();
  }

  PageController pageController = PageController(initialPage: 1);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
