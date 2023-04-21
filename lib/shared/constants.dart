import 'package:flutter/material.dart';
import 'package:sistaz_share_web/models/category.dart';

class Images {
  static const String logoIconWhite = 'assets/images/logo_icon_white.png';
  static const String logoTextWhite = 'assets/images/logo_text_white.png';
  static const String woman = 'assets/images/woman.jpg';
  static const String fixxiesLogo = 'assets/images/fixxies_logo.png';

  static const String blossom =
      'https://tinypic.host/images/2023/04/21/blossom.jpeg';
  static const String datingAndSex =
      'https://tinypic.host/images/2023/04/21/dating_and_sex.jpeg';
  static const String family =
      'https://tinypic.host/images/2023/04/21/family.jpeg';
  static const String fun = 'https://tinypic.host/images/2023/04/21/fun.jpeg';
  static const String lifestyle =
      'https://tinypic.host/images/2023/04/21/lifestyle.jpeg';
  static const String mindAndBody =
      'https://tinypic.host/images/2023/04/21/mind_and_body.jpeg';
  static const String money =
      'https://tinypic.host/images/2023/04/21/money.jpeg';
  static const String news = 'https://tinypic.host/images/2023/04/21/news.jpeg';
  static const String she = 'https://tinypic.host/images/2023/04/21/she.jpeg';
}

class Strings {
  static const String appName = 'Sistaz Share';
}

class Gifs {
  static const String logo = 'assets/gifs/splash.gif';
}

class Fonts {
  static const String mazzard = 'Mazzard';
  static const String autography = 'Autography';
  static const String timesNewRoman = 'Times-New-Roman';
}

class Urls {
  static const String facebook = 'https://web.facebook.com/sistazshare';
  static const String instagram = 'https://www.instagram.com/sistazshare/';
  static const String twitter = 'https://twitter.com/sistazshare';
}

List<Category> categories = [
  Blossom(),
  News(),
  Lifestyle(),
  MindAndBody(),
  Money(),
  Fun(),
  DatingAndSex(),
  Family(),
  She(),
];

InputDecoration textfieldDecoration = const InputDecoration(
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
  disabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
);
