import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';
import 'package:transparent_image/transparent_image.dart';

class Category {
  final Widget image;
  final String label;
  final List<String> subCategories;

  Category({
    required this.image,
    required this.label,
    required this.subCategories,
  });
}

class Blossom extends Category {
  Blossom()
      : super(
          label: 'Blossom',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.blossom,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Inspirational  •  ',
            'Quotes  •  ',
            'Motivational Messages  •  ',
            'Empowering Stories',
          ],
        );
}

class News extends Category {
  News()
      : super(
          label: 'News',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.news,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Current Affairs  •  ',
            'Trends  •  ',
            'Social Discussions',
          ],
        );
}

class Lifestyle extends Category {
  Lifestyle()
      : super(
          label: 'Lifestyle',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.lifestyle,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Fashion  •  ',
            'Beauty  •  ',
            'Culture  •  ',
            'Travel & Places',
          ],
        );
}

class MindAndBody extends Category {
  MindAndBody()
      : super(
          label: 'Mind & Body',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.mindAndBody,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Health  •  ',
            'Emotions  •  ',
            'Fertility  •  ',
            'Fitness'
          ],
        );
}

class Money extends Category {
  Money()
      : super(
          label: 'Money',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.money,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Entrepreneurship  •  ',
            'Investments  •  ',
            'Savings  •  ',
            'Work Place',
          ],
        );
}

class Fun extends Category {
  Fun()
      : super(
          label: 'Fun',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.fun,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Music  •  ',
            'Movies  •  ',
            'Games  •  ',
            'Sports  •  ',
            'Celebrities  •  ',
            'Shows',
          ],
        );
}

class DatingAndSex extends Category {
  DatingAndSex()
      : super(
          label: 'Dating & Sex',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.datingAndSex,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Love  •  ',
            'Orgasms  •  ',
            'Hard Truths  •  ',
            'Cheating  •  ',
            'Men',
          ],
        );
}

class Family extends Category {
  Family()
      : super(
          label: 'Family',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.family,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Marriage  •  ',
            'Kids  •  ',
            'Siblings  •  ',
            'Frienships'
          ],
        );
}

class She extends Category {
  She()
      : super(
          label: 'She',
          image: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: CloudImages.she,
            placeholder: kTransparentImage,
          ),
          subCategories: [
            'Women\'s History  •  ',
            'Women\'s Social Issues  •  ',
            ' Equity  •  ',
            ' Mental Strength',
          ],
        );
}
