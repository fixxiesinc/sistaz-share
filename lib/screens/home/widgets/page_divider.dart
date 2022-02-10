import 'package:flutter/material.dart';

class PageDivider extends StatelessWidget {
  final double? height;
  const PageDivider({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: const VerticalDivider(
        thickness: 1.5,
        color: Colors.white,
      ),
    );
  }
}
