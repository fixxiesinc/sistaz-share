import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class ThirdBody extends StatelessWidget {
  const ThirdBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        final bool isDesktop = sizingInformation.isDesktop;
        final _textStyle = isDesktop
            ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                  wordSpacing: 1.5,
                  letterSpacing: 1.5,
                  color: Colors.orange,
                  fontFamily: Fonts.mazzard,
                )
            : const TextStyle(
                fontSize: 20.0,
                wordSpacing: 1.5,
                letterSpacing: 1.5,
                color: Colors.orange,
                fontFamily: Fonts.mazzard,
              );
        return Material(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.0,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 200),
                    animatedTexts: [
                      FadeAnimatedText(
                        'COMING SOON',
                        textStyle: _textStyle,
                        duration: const Duration(seconds: 3),
                      ),
                      FadeAnimatedText(
                        'COMMUNITY  •  MAGAZINE',
                        textStyle: _textStyle.copyWith(color: Colors.white),
                        duration: const Duration(seconds: 3),
                      ),
                    ],
                  ),
                ),
                Text(
                  'the new disruption',
                  style: TextStyle(
                    wordSpacing: 1.5,
                    color: Colors.white,
                    fontFamily: Fonts.autography,
                    fontSize: isMobile
                        ? 44.0
                        : isTablet
                            ? Get.width * 0.09
                            : Get.width * 0.06,
                  ),
                ),
                const SizedBox(height: 20.0),
                ColoredButton(
                  label: 'READ & TELL STORIES',
                  onPressed: () => Get.toNamed('/join'),
                ),
                const SizedBox(height: 60.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
