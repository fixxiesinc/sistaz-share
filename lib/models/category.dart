import 'package:sistaz_share_web/exports.dart';

class Category {
  final String imageUrl;
  final String label;

  Category({
    required this.imageUrl,
    required this.label,
  });
}

class Blossom extends Category {
  Blossom() : super(label: 'Blossom', imageUrl: Images.blossom);
}

class News extends Category {
  News() : super(label: 'News', imageUrl: Images.news);
}

class Lifestyle extends Category {
  Lifestyle() : super(label: 'Lifestyle', imageUrl: Images.lifestyle);
}

class MindAndBody extends Category {
  MindAndBody() : super(label: 'Mind & Body', imageUrl: Images.mindAndBody);
}

class Money extends Category {
  Money() : super(label: 'Money', imageUrl: Images.money);
}

class Fun extends Category {
  Fun() : super(label: 'Fun', imageUrl: Images.fun);
}

class DatingAndSex extends Category {
  DatingAndSex() : super(label: 'Dating & Sex', imageUrl: Images.datingAndSex);
}

class Family extends Category {
  Family() : super(label: 'Family', imageUrl: Images.family);
}

class She extends Category {
  She() : super(label: 'She', imageUrl: Images.she);
}
