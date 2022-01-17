import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuProvider>(create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        home: const Splash(),
        title: 'Sistaz Share',
        theme: ThemeData(fontFamily: Fonts.mazzard),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
