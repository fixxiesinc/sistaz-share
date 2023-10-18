import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';
import 'package:sistaz_share_web/screens/become_a_contributor/widgets/writer_profile_card.dart';

class Attestations extends StatefulWidget {
  const Attestations({super.key});

  @override
  State<Attestations> createState() => _AttestationsState();
}

class _AttestationsState extends State<Attestations> {
  int currentIndex = 0;
  final PageController pageController = PageController();

  static String lorem = '''
It is a long established fact that a reader will be distracted by the readable content of a page when
looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',
making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem
ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and
the like).''';

  final List<String> testimonies = [
    lorem,
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    lorem,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // testimony
        ExpandablePageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            currentIndex = value;
            setState(() {});
          },
          children: List.generate(
            testimonies.length,
            (index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WriterProfileCard(
                    useWhiteTheme: true,
                    allowClicking: false,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    testimonies[index],
                    maxLines: 4,
                    style: Styles.body(context).copyWith(color: Colors.white),
                  ),
                  Container(),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 12.0),

        // dots indicator
        DotsIndicator(
          dotsCount: testimonies.length,
          position: currentIndex,
          onTap: (position) {
            currentIndex = position;
            pageController.animateToPage(
              currentIndex.toInt(),
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
            );
            setState(() {});
          },
          decorator: DotsDecorator(
            color: Colors.grey[800]!,
            activeColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
