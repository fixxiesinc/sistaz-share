import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class PageProvider extends GetxController {
  var currentPage = 0.obs;
  final PageController pageController = PageController();
  final List<Widget> pages = const [GetNotified(), BecomeAContributor()];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
