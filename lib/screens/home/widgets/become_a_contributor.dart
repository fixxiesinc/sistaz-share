import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class BecomeAContributor extends StatefulWidget {
  const BecomeAContributor({Key? key}) : super(key: key);

  @override
  State<BecomeAContributor> createState() => _BecomeAContributorState();
}

class _BecomeAContributorState extends State<BecomeAContributor> {
  final String firstCaption =
      '''Sistaz Share is an outlet for writers and creators who identify with women's empowerment. Our broad content scope embraces diverse perspectives and knowledge fields from across the globe. We encourage everyone - especially women folk - to share their stories and articles''';

  final String secondCaption =
      '''Join us now - write to us about yourself, your skills and interests in empowering women''';

  final TextStyle _captionStyle = const TextStyle(
    height: 1.3,
    fontSize: 19.0,
    letterSpacing: 0.3,
    color: Colors.white,
    fontFamily: Fonts.mazzard,
  );

  final PageProvider pageProvider = Get.find();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    scrollController.addListener(() {
      if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        pageProvider.pageController.previousPage(
            duration: const Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;
          bool isTablet = sizingInformation.isTablet;
          bool isDesktop = sizingInformation.isDesktop;
          return Padding(
            padding: EdgeInsets.only(
              left: isMobile ? 20.0 : 60.0,
              right: isMobile ? 20.0 : 60.0,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              // physics: const NeverScrollableScrollPhysics(),
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: isMobile
                        ? 20.0
                        : isTablet
                            ? 40.0
                            : Get.height * 0.05,
                  ),
                  SizedBox(
                    width: isDesktop ? Get.width * 0.6 : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Become a contributor',
                            style:
                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontFamily: Fonts.mazzard,
                                    ),
                            children: const [
                              TextSpan(
                                text: ' !',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Text(firstCaption, style: _captionStyle),
                        const SizedBox(height: 30.0),
                        const Divider(thickness: 1.5, color: Colors.white),
                        const SizedBox(height: 30.0),
                        RichText(
                          text: TextSpan(
                            text: secondCaption,
                            style: _captionStyle,
                            children: const [
                              TextSpan(
                                text: ' - contributors@sistazshare.org',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        Demoji.bouquet,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
