import 'package:sistaz_share_web/exports.dart';

class Utils {
  static Future<void> toggleMenu() async {
    if (menuKey.currentState!.isDrawerOpen) {
      menuKey.currentState!.closeDrawer();
    } else {
      menuKey.currentState!.openDrawer();
    }

    menuProvider.menuOpen(!menuProvider.menuOpen.value);

    await Future.delayed(const Duration(milliseconds: 600));
  }
}
