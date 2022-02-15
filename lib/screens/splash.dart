import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool showHome = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4000)).then((value) {
      setState(() => showHome = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: showHome
          ? const DelayedDisplay(
              child: Home(),
              slidingBeginOffset: Offset(0, 0),
              fadingDuration: Duration(milliseconds: 500),
            )
          : Center(
              child: Image.asset(Gifs.logo, height: 200.0, width: 200.0),
            ),
    );
  }
}
