import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FirstBody extends StatelessWidget {
  const FirstBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.black,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final bool isMobile = sizingInformation.isMobile;
          final bool isTablet = sizingInformation.isTablet;
          final bool isDesktop = sizingInformation.isDesktop;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20.0 : 60.0,
              vertical: 30.0,
            ),
            child: SizedBox(
              height: size.height - (kToolbarHeight + 40),
              child: Stack(
                children: [
                  Flex(
                    direction: isDesktop ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: isTablet
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: isDesktop
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: isDesktop ? 5 : 3,
                        child: RichText(
                          text: TextSpan(
                            text: 'Every',
                            style: TextStyle(
                              height: 1.3,
                              wordSpacing: 1.5,
                              color: Colors.white,
                              fontFamily: Fonts.mazzard,
                              fontSize: isMobile
                                  ? 32.0
                                  : isTablet
                                      ? size.width * 0.06
                                      : size.width * 0.045,
                            ),
                            children: [
                              const TextSpan(
                                text: ' woman',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                              isTablet
                                  ? const TextSpan(text: ' has a ')
                                  : const TextSpan(text: ' has a\n'),
                              const TextSpan(
                                text: 'voice',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                              isTablet
                                  ? const TextSpan(
                                      text: ' - we just make it louder')
                                  : const TextSpan(
                                      text: ' - we just make it \nlouder'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                        width: isDesktop ? size.width * 0.1 : 0.0,
                      ),
                      Expanded(
                        flex: isMobile
                            ? 3
                            : isTablet
                                ? 4
                                : 3,
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Image.asset(
                            Images.woman,
                            width: isMobile ? size.width : size.width * 0.3,
                            height: isMobile ? size.width : size.width * 0.3,
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: isDesktop ? size.height * 0.3 : size.height * 0.2,
                      child: const VerticalDivider(
                        thickness: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
