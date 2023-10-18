import 'package:sistaz_share_web/exports.dart';

class ViewController extends GetxController {
  late var currentView = AppView.none.obs;

  Rx<String> currentPage = 'Home'.obs;

  Rx<bool> splashPlayed = false.obs;
}
