import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        bool isTablet = sizingInformation.isTablet;
        return Consumer<MenuProvider>(
          builder: (context, provider, child) {
            return SizedBox(
              height: provider.menuOpen ? size.height : 0,
              child: Padding(
                padding: EdgeInsets.only(
                  left: isMobile ? 20.0 : 60.0,
                  right: isMobile ? 20.0 : 60.0,
                  bottom: 60.0,
                  top: isMobile
                      ? 20.0
                      : isTablet
                          ? 40.0
                          : 60.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Coming',
                            style: TextStyle(
                              color: Colors.orange,
                              fontFamily: Fonts.mazzard,
                              fontSize: isMobile
                                  ? 32.0
                                  : isTablet
                                      ? size.width * 0.06
                                      : size.width * 0.045,
                            ),
                            children: const [
                              TextSpan(
                                text: ' soon',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        const SocialHandles(),
                      ],
                    ),
                    const Footer(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
