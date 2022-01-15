import 'dart:js' as dartjs;
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SocialHandles extends StatelessWidget {
  const SocialHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialHandleItem(
          label: 'Instagram',
          onTap: () => dartjs.context.callMethod('open', [Urls.instagram]),
        ),
        const SizedBox(height: 30.0),
        SocialHandleItem(
          label: 'Facebook',
          onTap: () => dartjs.context.callMethod('open', [Urls.facebook]),
        ),
        const SizedBox(height: 30.0),
        SocialHandleItem(
          label: 'Twitter',
          onTap: () => dartjs.context.callMethod('open', [Urls.twitter]),
        ),
      ],
    );
  }
}
