import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Styles {
  static TextStyle h1(BuildContext context, {Color? color}) {
    return getValueForScreenType(
      context: context,
      mobile: Theme.of(context).textTheme.headlineSmall!.copyWith(
            height: 1.2,
            fontSize: 28.0,
            fontFamily: Fonts.mazzard,
            fontWeight: FontWeight.w400,
            color: color ?? Colors.black,
          ),
      desktop: Theme.of(context).textTheme.displaySmall!.copyWith(
            height: 1.2,
            fontFamily: Fonts.mazzard,
            fontWeight: FontWeight.w300,
            color: color ?? Colors.black,
          ),
    );
  }

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

  static TextStyle body(BuildContext context) {
    return TextStyle(
      height: 1.3,
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: getValueForScreenType(
          context: context, mobile: 18, tablet: 20, desktop: 20),
      letterSpacing: getValueForScreenType(context: context, mobile: 0.8),
    );
  }

  static TextStyle button = const TextStyle(
    fontSize: 14,
    wordSpacing: 3.5,
    letterSpacing: 0.6,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
