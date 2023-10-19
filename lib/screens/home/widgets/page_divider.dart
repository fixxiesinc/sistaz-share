import 'package:flutter/material.dart';

class PageDivider extends StatelessWidget {
  final double? height;
  const PageDivider({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height * 0.5,
      child: const VerticalDivider(
        thickness: 0.5,
        color: Colors.white,
      ),
    );
  }
}
