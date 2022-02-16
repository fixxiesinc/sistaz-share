import 'package:flutter/material.dart';
import 'package:sistaz_share_web/models/category.dart';

class Images {
  static const String imagesPath = 'assets/images/';
  static const String logoIconWhite = imagesPath + 'logo_icon_white.png';
  static const String logoTextWhite = imagesPath + 'logo_text_white.png';
  static const String woman = imagesPath + 'woman.jpg';
  static const String blossom = imagesPath + 'blossom.jpg';
  static const String datingAndSex = imagesPath + 'dating_and_sex.jpg';
  static const String family = imagesPath + 'family.jpg';
  static const String fun = imagesPath + 'fun.jpg';
  static const String lifestyle = imagesPath + 'lifestyle.jpg';
  static const String mindAndBody = imagesPath + 'mind_and_body.jpg';
  static const String money = imagesPath + 'money.jpg';
  static const String news = imagesPath + 'news.jpg';
  static const String she = imagesPath + 'she.jpg';
}

class CloudImages {
  static const String blossom =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Fblossom.jpg?alt=media&token=92b21c5f-3716-4ca2-82a7-595685aa1f21';
  static const String datingAndSex =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Fdating_and_sex.jpg?alt=media&token=98c9e11d-46c4-4e84-a93b-86608b19c199';
  static const String family =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Ffamily.jpg?alt=media&token=7e35ec76-3034-421b-8af6-66a5d5fc77d8';
  static const String fun =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Ffun.jpg?alt=media&token=dc711053-3de1-4506-91bc-b4866c6a8ae5';
  static const String lifestyle =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Flifestyle.jpg?alt=media&token=0b2ef74b-1b5b-4c4e-ad12-8a250f2c8a3d';
  static const String mindAndBody =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Fmind_and_body.jpg?alt=media&token=3d6961d9-ae47-4d24-9b57-fa005deed7b6';
  static const String money =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Fmoney.jpg?alt=media&token=27917a2d-03cf-46d0-9343-fb844c63d6f0';
  static const String news =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Fnews.jpg?alt=media&token=70eb51d5-f381-46c8-9c9b-c8e76313927b';
  static const String she =
      'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Fshe.jpg?alt=media&token=fcfbc00f-f0de-4dcf-b660-babd2b9138f8';
}

class Gifs {
  static const String logo = 'assets/gifs/splash.gif';
}

class Fonts {
  static const String mazzard = 'Mazzard';
  static const String autography = 'Autography';
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
