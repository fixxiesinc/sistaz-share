import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.transparent,
      overlayWidget: SizedBox(
        height: 5,
        child: GradientProgressIndicator(
          value: 0.9,
          gradient: LinearGradient(
            colors: [
              Colors.orange.withOpacity(0.5),
              Colors.orange,
            ],
          ),
        ),
      ),
      child: ResponsiveApp(builder: (_) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: Fonts.mazzard,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(elevation: 0),
          ),
        );
      }),
    );
  }
}
