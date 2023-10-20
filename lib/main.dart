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
  GetIt.I.registerSingleton<ViewController>(Get.put(ViewController()));
  GetIt.I.registerSingleton<FormController>(Get.put(FormController()));
  GetIt.I.registerSingleton<ChatController>(Get.put(ChatController()));
  GetIt.I.registerSingleton<UserController>(Get.put(UserController()));
}

MenuProvider get menuProvider => GetIt.I.get<MenuProvider>();
ViewController get viewController => GetIt.I.get<ViewController>();
FormController get formController => GetIt.I.get<FormController>();
ChatController get chatController => GetIt.I.get<ChatController>();
UserController get userController => GetIt.I.get<UserController>();

final db = FirebaseFirestore.instance;
