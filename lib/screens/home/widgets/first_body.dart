import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FirstBody extends StatelessWidget {
  const FirstBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      final bool isMobile = sizingInformation.isMobile;
      final bool isTablet = sizingInformation.isTablet;
      return RichText(
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
                    ? size.width * 0.065
                    : size.width * 0.045,
          ),
          children: const [
            TextSpan(
              text: ' woman',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(text: ' has a\n'),
            TextSpan(
              text: 'voice',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(text: ' - we just make it louder'),
          ],
        ),
      );
    });
  }
}
