import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FAQDiv extends StatelessWidget {
  const FAQDiv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.isMobile;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 16.0 : 8.0),
          child: const Divider(color: Colors.white, thickness: 1.0),
        );
      },
    );
  }
}
