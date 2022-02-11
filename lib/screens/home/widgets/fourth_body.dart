import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FourthBody extends StatelessWidget {
  const FourthBody({Key? key}) : super(key: key);

  final String team =
      '''Fixxies Inc, got restless of mainstream women's empowerment, and created an e-platform where the world would indulge on the go. We imagine a community of stimulated voices sharing highly engaging and socially driven content, that would redefine the perspectives on women's issues.''';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.black,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;
          bool isDesktop = sizingInformation.isDesktop;
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: Get.height * (isMobile ? 0.1 : 0.2),
              horizontal: isMobile ? 20.0 : 60.0,
            ),
            child: Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment:
                  isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                isDesktop
                    ? Container()
                    : Image.asset(
                        Images.logoIconWhite,
                        width: size.width * 0.3,
                      ),
                isDesktop ? Container() : const SizedBox(height: 40.0),
                Expanded(
                  flex: isDesktop ? 7 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get in touch',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile
                              ? 24.0
                              : isDesktop
                                  ? 40.0
                                  : 30.0,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'For general inquiries , partnerships, reviews and recommendations - write to us',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'hello@sistazshare.org',
                        style: TextStyle(color: Colors.orange, fontSize: 18.0),
                      ),
                      const SizedBox(height: 30.0),
                      const Divider(thickness: 1.5, color: Colors.white),
                      const SizedBox(height: 30.0),
                      Text(
                        'Team',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile
                              ? 24.0
                              : isDesktop
                                  ? 40.0
                                  : 30.0,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        team,
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'www.fixxies.com',
                        style: TextStyle(color: Colors.orange, fontSize: 18.0),
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
                isDesktop ? const Spacer(flex: 2) : Container(),
                isDesktop
                    ? Expanded(
                        flex: 3,
                        child: Image.asset(
                          Images.logoIconWhite,
                          width: size.width * 0.3,
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
