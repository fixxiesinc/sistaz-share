import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';
import 'package:sistaz_share_web/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  registerSingletons();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

void registerSingletons() {
  GetIt.I.registerSingleton<MenuProvider>(Get.put(MenuProvider()));
  GetIt.I.registerSingleton<PageProvider>(Get.put(PageProvider()));
}

MenuProvider get menuProvider => GetIt.I.get<MenuProvider>();
PageProvider get pageController => GetIt.I.get<PageProvider>();


