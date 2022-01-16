import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        bool isTablet = sizingInformation.isTablet;
        bool isDesktop = sizingInformation.isDesktop;
        return SafeArea(
          child: Padding(
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
                  onTap: () => html.window.location.reload(),
                  child: Image.asset(
                    Images.logoTextWhite,
                    width: isMobile
                        ? size.width * 0.35
                        : isTablet
                            ? size.width * 0.2
                            : size.width * 0.12,
                  ),
                ),
                const Text(
                  'MENU',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
