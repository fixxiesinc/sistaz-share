import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Styles {
  static TextStyle h2(BuildContext context) {
    return getValueForScreenType(
      context: context,
      mobile: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w300,
          ),
      desktop: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w300,
          ),
    );
  }
}
