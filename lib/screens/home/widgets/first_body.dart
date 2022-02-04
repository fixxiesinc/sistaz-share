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
            padding: EdgeInsets.only(
              left: isMobile ? 20.0 : 60.0,
              right: isMobile ? 20.0 : 60.0,
              bottom: 60.0,
              top: isMobile
                  ? 20.0
                  : isTablet
                      ? 40.0
                      : 60.0,
            ),
            child: Wrap(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: isTablet
                  ? WrapCrossAlignment.center
                  : WrapCrossAlignment.start,
              alignment:
                  isDesktop ? WrapAlignment.spaceBetween : WrapAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'An evolving zone for \nzestful',
                    style: TextStyle(
                      height: 1.3,
                      wordSpacing: 1.5,
                      color: Colors.white,
                      fontFamily: Fonts.mazzard,
                      fontSize: isMobile
                          ? 32.0
                          : isTablet
                              ? size.width * 0.06
                              : size.width * 0.035,
                    ),
                    children: const [
                      TextSpan(
                        text: ' women',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  width: isDesktop ? size.width * 0.1 : 0.0,
                ),
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    Images.woman,
                    width: isMobile ? size.width : size.width * 0.3,
                    height: isMobile ? size.width : size.width * 0.3,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
