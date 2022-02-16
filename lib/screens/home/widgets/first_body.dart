import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FirstBody extends StatelessWidget {
  const FirstBody({Key? key}) : super(key: key);

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
              left: isMobile ? 20.0 : 60.0,
              right: isMobile ? 20.0 : 60.0,
              top: isMobile
                  ? 20.0
                  : isTablet
                      ? 40.0
                      : Get.height * 0.05,
            ),
            child: Wrap(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment:
                  isTablet ? WrapCrossAlignment.end : WrapCrossAlignment.start,
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
                              ? Get.width * 0.06
                              : Get.width * 0.035,
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
                  width: isDesktop ? Get.width * 0.1 : 0.0,
                ),
                Image.asset(
                  Images.woman,
                  width: isMobile ? Get.width * 0.8 : Get.width * 0.3,
                  height: isMobile ? Get.width * 0.8 : Get.width * 0.3,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
