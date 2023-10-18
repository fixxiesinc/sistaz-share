import 'package:sistaz_share_web/exports.dart';

class ViewController extends GetxController {
  Rx<String> currentPage = 'Home'.obs;

  Rx<bool> splashPlayed = false.obs;
}
