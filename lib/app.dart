import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context) {
        switch (Get.currentRoute) {
          case '/contact':
            return 'Contact';
          case '/join':
            return 'Join Us';
          default:
            return Strings.appName;
        }
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: Fonts.mazzard),
      initialRoute: '/',
      defaultTransition: Transition.fade,
      routes: {
        '/': (p0) => const Splash(),
        '/contact': (p0) => const GetInTouch(),
        '/join': (p0) => const TellStories(),
      },
    );
  }
}
