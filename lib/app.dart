import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PageProvider());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuProvider>(create: (_) => MenuProvider()),
      ],
      child: GetMaterialApp(
        home: const Splash(),
        title: 'Sistaz Share',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: Fonts.mazzard),
      ),
    );
  }
}
