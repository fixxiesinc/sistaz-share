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

class Images {
  static const String logoIconWhite = 'assets/images/logo_icon_white.png';
  static const String logoTextWhite = 'assets/images/logo_text_white.png';
  static const String woman = 'assets/images/woman.jpg';
  static const String womanStraight = 'assets/images/woman_straight.jpg';
  static const String fixxiesLogo = 'assets/images/fixxies_logo.png';

  static const String facebook = 'assets/images/facebook.png';
  static const String instagram = 'assets/images/instagram.png';
  static const String linkedin = 'assets/images/linkedin.png';
  static const String pinterest = 'assets/images/pinterest.png';
  static const String snapchat = 'assets/images/snapchat.png';
  static const String twitter = 'assets/images/twitter.png';
}

class Strings {
  static const String appName = 'Sistaz Share';
}

class Gifs {
  static const String logo = 'assets/gifs/splash.gif';
}

class Fonts {
  static const String mazzard = 'Mazzard';
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
