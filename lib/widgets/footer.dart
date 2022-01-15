import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20.0 : 40.0,
              vertical: 20.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(Images.logoIconWhite, height: 20.0),
                    const SizedBox(width: 12.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'COPYRIGHT SISTAZ SHARE ${DateTime.now().year}',
                          style: const TextStyle(
                            fontSize: 10.0,
                            wordSpacing: 1.6,
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
                        fontSize: 10.0,
                        wordSpacing: 1.6,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                isMobile ? Container() : const SocialMediaButtons(),
              ],
            ),
          ),
        );
      },
    );
  }
}
