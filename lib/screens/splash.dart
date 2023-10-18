import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4000)).then((value) {
      viewController.splashPlayed(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),

          Image.asset(Gifs.logo, height: 200.0, width: 200.0),

          // from fixxies
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'from',
                  style: TextStyle(
                    letterSpacing: 0.7,
                    fontSize: getValueForScreenType(
                      context: context,
                      mobile: 16,
                      desktop: 18,
                    ),
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                    fontFamily: Fonts.timesNewRoman,
                  ),
                ),
                Gap(
                  getValueForScreenType(
                    context: context,
                    mobile: 12,
                    desktop: 20,
                  ),
                ),
                Image.asset(
                  Images.fixxiesLogo,
                  color: Colors.white.withOpacity(0.7),
                  width: getValueForScreenType(
                    context: context,
                    mobile: MediaQuery.of(context).size.width * 0.25,
                    desktop: MediaQuery.of(context).size.width * 0.075,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
