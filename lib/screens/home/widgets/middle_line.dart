import 'package:flutter/material.dart';

class MiddleLine extends StatelessWidget {
  const MiddleLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.7,
      child: const VerticalDivider(
        thickness: 1.5,
        color: Colors.white,
      ),
    );
  }
}
