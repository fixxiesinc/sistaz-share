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
    return Title(
      color: Colors.black,
      title: 'Join Us | Sistaz Share',
      child: ResponsiveBuilder(
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
                        Container(),
                        Obx(
                          () => RotatedBox(
                            quarterTurns: 1,
                            child: DotsIndicator(
                              dotsCount: pageProvider.pages.length,
                              position: pageProvider.currentPage.value,
                              decorator: DotsDecorator(
                                color: Colors.grey[800]!,
                                activeColor: Colors.white,
                                spacing: const EdgeInsets.all(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: pageProvider.pages.length,
                      controller: pageProvider.pageController,
                      onPageChanged: (value) {
                        pageProvider.currentPage(value);
                      },
                      itemBuilder: (context, index) => pageProvider.pages[index],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
