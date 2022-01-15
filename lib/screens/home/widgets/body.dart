import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        final bool isDesktop = sizingInformation.isDesktop;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 40.0),
          child: Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: child,
                flex: isMobile
                    ? 3
                    : isTablet
                        ? 6
                        : 5,
              ),
              SizedBox(
                width: isDesktop ? size.width * 0.1 : 0.0,
                height: isMobile
                    ? size.height * 0.06
                    : isTablet
                        ? size.width * 0.15
                        : 0.0,
              ),
              Expanded(
                flex: isMobile
                    ? 6
                    : isTablet
                        ? 8
                        : 3,
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    Images.woman,
                    width: isDesktop ? size.width * 0.3 : size.width,
                    height: isDesktop ? size.width * 0.3 : size.width,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
