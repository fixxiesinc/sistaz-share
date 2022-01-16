import 'dart:js' as dartjs;
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SocialHandles extends StatelessWidget {
  const SocialHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SocialHandleItem(
              label: 'Instagram',
              onTap: () => dartjs.context.callMethod('open', [Urls.instagram]),
            ),
            Container(
              height: 1.5,
              color: Colors.white,
              width: isMobile ? double.infinity : size.width * 0.3,
            ),
            const SizedBox(height: 30.0),
            SocialHandleItem(
              label: 'Facebook',
              onTap: () => dartjs.context.callMethod('open', [Urls.facebook]),
            ),
            Container(
              color: Colors.white,
              height: 1.5,
              width: isMobile ? double.infinity : size.width * 0.3,
            ),
            const SizedBox(height: 30.0),
            SocialHandleItem(
              label: 'Twitter',
              onTap: () => dartjs.context.callMethod('open', [Urls.twitter]),
            ),
          ],
        );
      },
    );
  }
}
