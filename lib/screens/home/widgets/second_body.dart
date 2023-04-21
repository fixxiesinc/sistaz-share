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
          final bool isDesktop = sizingInformation.isDesktop;
          return Flex(
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
                      RichText(
                        text: TextSpan(
                          text: caption,
                          style:
                              Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    color: Colors.orange,
                                    fontFamily: Fonts.mazzard,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
              Expanded(
                flex: isDesktop ? 6 : 0,
                child: const StoryCategories(),
              ),
            ],
          );
        },
      ),
    );
  }
}
