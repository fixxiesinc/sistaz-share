import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Text(
              'ALL RIGHTS RESERVED SISTAZ SHARE ${DateTime.now().year}',
              style: const TextStyle(
                fontSize: 10.0,
                wordSpacing: 1.6,
                letterSpacing: 1.3,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
