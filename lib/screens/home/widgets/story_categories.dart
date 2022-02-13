import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class StoryCategories extends StatefulWidget {
  const StoryCategories({Key? key}) : super(key: key);

  @override
  State<StoryCategories> createState() => _StoryCategoriesState();
}

class _StoryCategoriesState extends State<StoryCategories> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        final bool isDesktop = sizingInformation.isDesktop;
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            pageSnapping: false,
            height: isDesktop ? Get.height * 0.6 : Get.height * 0.5,
            viewportFraction: isDesktop
                ? 0.7
                : isTablet
                    ? 0.6
                    : 0.9,
          ),
          items: List.generate(
            categories.length,
            (index) {
              Category category = categories[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: isMobile
                      ? 20.0
                      : index == categories.length - 1
                          ? 60.0
                          : 30.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: category.image,
                      color: Colors.grey[900],
                      height: isDesktop ? Get.height * 0.5 : Get.height * 0.4,
                      width: isMobile ? Get.width * 0.9 : Get.height * 0.7,
                    ),
                    const SizedBox(height: 26.0),
                    Text(
                      category.label,
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
