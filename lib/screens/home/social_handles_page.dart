import 'dart:js' as dartjs;
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SocialHandles extends StatelessWidget {
  const SocialHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialHandleItem(
            label: 'Twitter',
            onTap: () => dartjs.context.callMethod('open', [Urls.twitter]),
          ),
          SizedBox(height: 30.0),
          SocialHandleItem(
            label: 'Instagram',
            onTap: () => dartjs.context.callMethod('open', [Urls.instagram]),
          ),
          SizedBox(height: 30.0),
          SocialHandleItem(
            label: 'Facebook',
            onTap: () => dartjs.context.callMethod('open', [Urls.facebook]),
          ),
        ],
      ),
    );
  }
}
