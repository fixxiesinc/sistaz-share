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
                      : MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              children: [
                Text(
                  'A medium of unbounded storytelling for women who are discovering the world and themselves in the process',
                  style: TextStyle(
                    height: 1.3,
                    wordSpacing: 1.5,
                    color: Colors.white,
                    fontFamily: Fonts.mazzard,
                    fontSize: isMobile
                        ? 32.0
                        : isTablet
                            ? MediaQuery.of(context).size.width * 0.06
                            : MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  width:
                      isDesktop ? MediaQuery.of(context).size.width * 0.1 : 0.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Image.asset(
                      Images.woman,
                      width: isMobile
                          ? MediaQuery.of(context).size.width * 0.8
                          : MediaQuery.of(context).size.width * 0.3,
                      height: isMobile
                          ? MediaQuery.of(context).size.width * 0.8
                          : MediaQuery.of(context).size.width * 0.3,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
