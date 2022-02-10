import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SecondBody extends StatelessWidget {
  const SecondBody({Key? key}) : super(key: key);

  final String caption =
      '''Sistaz Share publishes social, lifestyle and personal development content - that highlight stories relatable to the feminine endeavor''';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        return Material(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(
              left: isMobile ? 20.0 : 60.0,
              // right: isMobile ? 20.0 : 60.0,
              bottom: 60.0,
              top: isMobile
                  ? 20.0
                  : isTablet
                      ? 40.0
                      : 60.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Our',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.orange,
                            fontFamily: Fonts.mazzard,
                            fontStyle: FontStyle.italic,
                          ),
                          children: [
                            TextSpan(
                              text: '  Editorial',
                              style: TextStyle(fontStyle: FontStyle.normal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        caption,
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Expanded(flex: 6, child: StoryCategories()),
              ],
            ),
          ),
        );
      },
    );
  }
}
