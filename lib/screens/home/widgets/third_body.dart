import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class ThirdBody extends StatelessWidget {
  const ThirdBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        final _textStyle = TextStyle(
          wordSpacing: 1.5,
          letterSpacing: 1.5,
          color: Colors.orange,
          fontFamily: Fonts.mazzard,
          fontSize: isMobile
              ? 16.0
              : isTablet
                  ? size.width * 0.02
                  : size.width * 0.014,
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
                            ? size.width * 0.09
                            : size.width * 0.06,
                  ),
                ),
                const SizedBox(height: 20.0),
                FilledButton(
                  label: 'READ & TELL STORIES',
                  onPressed: () => Get.to(
                    () => const TellStories(),
                    routeName: 'read-and-tell-your-stories',
                  ),
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
