import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({Key? key}) : super(key: key);

  final TextStyle _textStyle = const TextStyle(
    fontSize: 12.0,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return Wrap(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            InkWell(
              onTap: () => print('TW'),
              child: Text('TW', style: _textStyle),
            ),
            SizedBox(width: isMobile ? 0 : 30.0, height: isMobile ? 30.0 : 0),
            InkWell(
              onTap: () => print('IG'),
              child: Text('IG', style: _textStyle),
            ),
            SizedBox(width: isMobile ? 0 : 30.0, height: isMobile ? 30.0 : 0),
            InkWell(
              onTap: () => print('FB'),
              child: Text('FB', style: _textStyle),
            ),
          ],
        );
      },
    );
  }
}
