import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          FirstBody(),
          SizedBox(height: 60.0),
          SecondBody(),
          // SizedBox(height: 60.0),
          // ThirdBody(),
          // SizedBox(height: 60.0),
          PageDivider(),
          SizedBox(height: 60.0),
          LastBody(),
        ],
      ),
    );
  }
}

class SecondBody extends StatelessWidget {
  const SecondBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Home | Sistaz Share',
      color: Colors.black,
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        return Column(
          children: [
            Text(
              'Explore',
              style: TextStyle(
                wordSpacing: 1.5,
                color: Colors.orange,
                fontFamily: Fonts.autography,
                fontSize: isMobile
                    ? 44.0
                    : isTablet
                        ? MediaQuery.of(context).size.width * 0.09
                        : MediaQuery.of(context).size.width * 0.06,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20.0 : 60.0,
              ),
              child: isMobile
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: SeparatedColumn(
                        separatorBuilder: () {
                          return const Divider(
                            height: 50,
                            color: Colors.white,
                          );
                        },
                        children: const [
                          ExploreText(
                            text:
                                'Our anonymous feature creates a safe space for you to express how you really feel',
                          ),
                          ExploreText(
                            text:
                                'Interactive AI Counsellor that would not judge you or tell your secrets to the world',
                          ),
                          ExploreText(
                            text:
                                'Earn points for being a great sport anytime you share a story',
                          ),
                          ExploreText(
                            text:
                                'Explore great content on personal development and building self confidence',
                          ),
                        ],
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExploreText(
                                    text:
                                        'Our anonymous feature creates a safe space for you to express how you really feel'),
                                Gap(40),
                                ExploreText(
                                    text:
                                        'Interactive AI Counsellor that would not judge you or tell your secrets to the world'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20.0 : 60.0,
                          ),
                          child: PageDivider(
                              height: MediaQuery.of(context).size.height * 0.3),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExploreText(
                                    text:
                                        'Earn points for being a great sport anytime you share a story'),
                                Gap(40),
                                ExploreText(
                                  text:
                                      'Explore great content on personal development and building self confidence',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        );
      }),
    );
  }
}

class ExploreText extends StatelessWidget {
  final String text;
  const ExploreText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontFamily: Fonts.mazzard,
          ),
    );
  }
}
