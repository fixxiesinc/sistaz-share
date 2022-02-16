import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class PageDivider extends StatelessWidget {
  final double? height;
  const PageDivider({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.5,
      child: const VerticalDivider(
        thickness: 1.5,
        color: Colors.white,
      ),
    );
  }
}
