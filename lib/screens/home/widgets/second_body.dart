import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SecondBody extends StatelessWidget {
  const SecondBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        final bool isDesktop = sizingInformation.isDesktop;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 40.0),
          child: Stack(
            children: [
              Flex(
                mainAxisSize: MainAxisSize.min,
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: isMobile
                        ? 0
                        : isTablet
                            ? 6
                            : 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'the new disruption',
                          style: TextStyle(
                            wordSpacing: 1.5,
                            color: Colors.white,
                            fontFamily: Fonts.autography,
                            fontSize: isMobile
                                ? 34.0
                                : isTablet
                                    ? size.width * 0.07
                                    : size.width * 0.06,
                          ),
                        ),
                        Container(
                          height: 1.0,
                          color: Colors.white,
                          width: double.infinity,
                        ),
                        SizedBox(height: isDesktop ? 40.0 : 20.0),
                        RichText(
                          text: TextSpan(
                            text: 'Coming',
                            style: TextStyle(
                              wordSpacing: 1.5,
                              color: Colors.orange,
                              fontFamily: Fonts.mazzard,
                              fontSize: isMobile
                                  ? 32.0
                                  : isTablet
                                      ? size.width * 0.065
                                      : size.width * 0.045,
                            ),
                            children: const [
                              TextSpan(
                                text: ' soon',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: isDesktop ? size.width * 0.1 : 0.0,
                    height: isDesktop ? 0.0 : size.height * 0.1,
                  ),
                  Flexible(
                    flex: isMobile
                        ? 0
                        : isTablet
                            ? 8
                            : 3,
                    child: const SocialHandles(),
                  ),
                ],
              ),
              const Positioned(bottom: 0.0, child: Footer()),
            ],
          ),
        );
      },
    );
  }
}
