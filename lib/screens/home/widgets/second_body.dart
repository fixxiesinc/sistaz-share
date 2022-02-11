import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SecondBody extends StatelessWidget {
  const SecondBody({Key? key}) : super(key: key);

  final String caption =
      '''Sistaz Share publishes social, lifestyle and personal development content - that highlight stories relatable to the feminine endeavor''';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final bool isMobile = sizingInformation.isMobile;
          final bool isTablet = sizingInformation.isTablet;
          final bool isDesktop = sizingInformation.isDesktop;
          return Padding(
            padding: EdgeInsets.only(
              bottom: 60.0,
              top: isMobile
                  ? 20.0
                  : isTablet
                      ? 40.0
                      : 60.0,
            ),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: isDesktop ? 6 : 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20.0 : 60.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isDesktop ? 0 : 30.0),
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
                        SizedBox(height: isMobile ? 20.0 : 30.0),
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
                ),
                SizedBox(height: isMobile ? 20.0 : 30.0),
                isDesktop ? const Spacer() : Container(),
                Expanded(
                  flex: isDesktop ? 6 : 0,
                  child: const StoryCategories(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
