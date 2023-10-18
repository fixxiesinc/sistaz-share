import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  static const String inAddition =
      '''In addition to the content you publish, you can refer readers to become Sistaz Share members and get half of their membership fee, net of standard payment processor fees, for as long as they remain a member''';

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Contact | Sistaz Share',
      color: Colors.black,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final isMobile = sizingInformation.isMobile;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
              horizontal: Doubles.marginX(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${"We're open to suggestions, reviews & collaborations from across the world"} ${Demoji.sun_behind_small_cloud}',
                  style: Styles.h1(context).copyWith(color: Colors.white),
                ),
                SizedBox(
                    height: isMobile
                        ? MediaQuery.of(context).size.height * 0.06
                        : MediaQuery.of(context).size.height * 0.1),
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Partnerships',
                            style: Styles.h2(context)
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Text(
                            inAddition,
                            style: Styles.body(context)
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Text(
                            'partnerships@sistazshare.org',
                            style: Styles.body(context)
                                .copyWith(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reviews & Suggestions',
                            style: Styles.h2(context)
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Text(
                            inAddition,
                            style: Styles.body(context)
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Text(
                            'info@sistazshare.org',
                            style: Styles.body(context)
                                .copyWith(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
