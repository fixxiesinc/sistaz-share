import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  List<Widget> pages = const [
    Body(child: FirstBody()),
    Body(child: SecondBody())
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  bool isMobile = sizingInformation.isMobile;
                  bool isTablet = sizingInformation.isTablet;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: isMobile ? 20.0 : 40.0),
                        child: SizedBox(
                          height: kToolbarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => html.window.location.reload(),
                                child: Image.asset(
                                  Images.logoTextWhite,
                                  width: isMobile
                                      ? size.width * 0.3
                                      : isTablet
                                          ? size.width * 0.2
                                          : size.width * 0.12,
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: DotsIndicator(
                                  dotsCount: pages.length,
                                  position: currentPage.toDouble(),
                                  decorator: DotsDecorator(
                                    activeColor: Colors.white,
                                    size: const Size.square(7.0),
                                    activeSize: const Size.square(7.0),
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: isMobile ? 30.0 : size.height * 0.08),
                      Expanded(
                        child: PageView.builder(
                          itemCount: pages.length,
                          itemBuilder: (context, index) => pages[index],
                          onPageChanged: (value) {
                            setState(() => currentPage = value);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
