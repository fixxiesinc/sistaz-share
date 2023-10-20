import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({Key? key}) : super(key: key);

  @override
  State<JoinUs> createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  String pincode = '';

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: 'Welcome | Sistaz Share',
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;
          bool isDesktop = sizingInformation.isDesktop;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Doubles.marginX(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Doubles.marginX(context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: Styles.h1(context, color: Colors.white),
                        ),
                        Gap(isMobile ? 20 : 30),
                        Flex(
                          direction: isMobile ? Axis.vertical : Axis.horizontal,
                          children: [
                            // login
                            Link(
                              uri: Uri.parse(
                                '/${Routes.welcome}/${Routes.login}',
                              ),
                              builder: (context, followLink) {
                                return Button(
                                  label: 'Log In',
                                  labelSize: 14,
                                  paddingBlock: 14,
                                  paddingInline: 100,
                                  maxWidth: isDesktop ? false : true,
                                  color: Colors.white,
                                  onPressed: () => followLink!(),
                                );
                              },
                            ),

                            const Gap(12),

                            // register
                            Link(
                              uri: Uri.parse(
                                '/${Routes.welcome}/${Routes.register}',
                              ),
                              builder: (context, followLink) {
                                return Button(
                                  label: 'Sign Up',
                                  labelSize: 14,
                                  paddingBlock: 14,
                                  paddingInline: 100,
                                  maxWidth: isDesktop ? false : true,
                                  color: Colors.transparent,
                                  labelColor: Colors.white,
                                  borderColor: Colors.white,
                                  onPressed: () => followLink!(),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // illustration
                Expanded(
                  flex: isDesktop ? 1 : 0,
                  child: Visibility(
                    visible: isDesktop ? true : false,
                    child: Transform.flip(
                      flipX: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Doubles.marginX(context)),
                        child: Image.asset(
                          Images.woman,
                          width: isMobile
                              ? MediaQuery.of(context).size.width * 0.8
                              : MediaQuery.of(context).size.width * 0.3,
                          height: isMobile
                              ? MediaQuery.of(context).size.width * 0.8
                              : MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
