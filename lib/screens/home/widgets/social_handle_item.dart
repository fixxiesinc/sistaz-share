import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SocialHandleItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const SocialHandleItem({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              final bool isMobile = sizingInformation.isMobile;
              final bool isTablet = sizingInformation.isTablet;
              return Text(
                label.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: isMobile
                      ? 14.0
                      : isTablet
                          ? size.width * 0.02
                          : size.width * 0.010,
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
