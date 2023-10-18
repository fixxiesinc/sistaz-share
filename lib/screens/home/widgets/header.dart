import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final randomGradient = Random();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return Obx(
          () {
            bool useWhiteBackground =
                viewController.currentPage.value == 'Become a Counsellor';
            return AnimatedContainer(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 100),
              alignment: Alignment.topCenter,
              color: useWhiteBackground ? Colors.white : Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20.0 : 60.0,
                vertical: isMobile
                    ? 16.0
                    : MediaQuery.of(context).size.height * 0.034,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // logo
                  Link(
                    uri: Uri.parse('/'),
                    builder: (context, followLink) {
                      return InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          viewController.currentPage('Home');
                          followLink!();
                        },
                        child: Image.asset(
                          Images.logoTextWhite,
                          color: useWhiteBackground ? Colors.black : null,
                          width: isMobile
                              ? MediaQuery.of(context).size.width * 0.35
                              : MediaQuery.of(context).size.width * 0.11,
                        ),
                      );
                    },
                  ),

                  // menu button
                  InkWell(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      menuProvider.menuOpen.value =
                          !menuProvider.menuOpen.value;
                    },
                    child: Text(
                      menuProvider.menuOpen.value ? 'CLOSE' : 'MENU',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: Fonts.anton,
                        fontSize: isMobile ? 14.0 : 16.0,
                        color: useWhiteBackground ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
