import 'package:animated_text_kit/animated_text_kit.dart';
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
                const SizedBox(height: 60.0),
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
                ElevatedButton(
                  onPressed: () => print('Tap'),
                  child: Text(
                    'READ & TELL STORIES',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
                      (Set<MaterialState> states) {
                        return const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 30.0,
                        );
                      },
                    ),
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
