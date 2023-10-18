import 'package:flutter/material.dart';

enum AppView {
  none,
  home,
  joinUs,
  becomeACounselor,
  ourStory,
  contact,
  inviteAFriend,
}

class Doubles {
  static marginX(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.035;
  }
}

class Strings {
  static const String appName = 'Sistaz Share';
}

class Gifs {
  static const String logo = 'assets/gifs/splash.gif';
}

class Fonts {
  static const String mazzard = 'MazzardM';
  static const String anton = 'Anton';
  static const String autography = 'Autography';
  static const String timesNewRoman = 'Times-New-Roman';
}

class Urls {
  static const String facebook = 'https://web.facebook.com/sistazshare';
  static const String instagram = 'https://www.instagram.com/sistazshare/';
  static const String twitter = 'https://twitter.com/sistazshare';
}

InputDecoration textfieldDecoration = const InputDecoration(
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
  disabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
);
