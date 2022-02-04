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
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Images.logoIconWhite, height: 20.0),
                  const SizedBox(width: 12.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'COPYRIGHT SISTAZ SHARE ${DateTime.now().year}',
                        style: const TextStyle(
                          fontSize: 8.0,
                          wordSpacing: 1.6,
                          letterSpacing: 1.3,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Container(
                        width: 4.0,
                        height: 4.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12.0),
                  const Text(
                    'FROM FIXXIES',
                    style: TextStyle(
                      fontSize: 8.0,
                      wordSpacing: 1.6,
                      color: Colors.white,
                      letterSpacing: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
