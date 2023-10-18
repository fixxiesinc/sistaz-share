import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Fonts.mazzard,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
    );
  }
}
