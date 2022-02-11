import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class TellStories extends StatefulWidget {
  const TellStories({Key? key}) : super(key: key);

  @override
  State<TellStories> createState() => _TellStoriesState();
}

class _TellStoriesState extends State<TellStories> {
  final PageProvider pageProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        bool isDesktop = sizingInformation.isDesktop;
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 20.0,
                    top: isDesktop ? 40.0 : 30.0,
                    left: isMobile ? 20.0 : 60.0,
                    right: isMobile ? 20.0 : 60.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Obx(
                        () => DotsIndicator(
                          dotsCount: pageProvider.pages.length,
                          position: pageProvider.currentPage.toDouble(),
                          decorator: DotsDecorator(
                            spacing: const EdgeInsets.all(12.0),
                            color: Colors.grey[800]!,
                            activeColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: pageProvider.pageController,
                    itemCount: pageProvider.pages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => pageProvider.pages[index],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
