import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class InviteAFriend extends StatefulWidget {
  const InviteAFriend({Key? key}) : super(key: key);

  @override
  State<InviteAFriend> createState() => _InviteAFriendState();
}

class _InviteAFriendState extends State<InviteAFriend> {
  final List<String> socialAccounts = [
    Images.twitter,
    Images.facebook,
    Images.linkedin,
  ];

  String copyLinkText = 'Copy Link';

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: 'Invite a Friend | Sistaz Share',
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final isMobile = sizingInformation.isMobile;
          return isMobile
              ? SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.035,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'Help us a reach a larger audience'} ${Demoji.sun_behind_small_cloud}',
                          style: Styles.h1(context, color: Colors.white),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
    
                        Container(
                          width: double.infinity,
                          color: Colors.black45,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Image.asset(Images.invite, fit: BoxFit.cover),
                        ),
    
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
    
                        // 22,000 readers
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '22,000 Readers +',
                              style: Styles.h2(context).copyWith(
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),
                            Text(
                              'Follow us in social media and share our platform to your friends to explore our community',
                              style: Styles.body(context)
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Row(
                              children: [
                                Button(
                                  label: copyLinkText.toUpperCase(),
                                  paddingBlock: 12,
                                  color: Colors.transparent,
                                  borderColor: Colors.white,
                                  onPressed: () async {
                                    await FlutterClipboard.copy(
                                        'https://sistaz-share.web.app');
                                    setState(() => copyLinkText = 'COPIED ✅');
                                  },
                                ),
                                const SizedBox(width: 20.0),
                                // social media icons
                                SeparatedRow(
                                  separatorBuilder: () =>
                                      const SizedBox(width: 20.0),
                                  children: List.generate(
                                    socialAccounts.length,
                                    (index) {
                                      return Image.asset(
                                        socialAccounts[index],
                                        color: Colors.white,
                                        height: 35.0,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
    
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
    
                        // free publication for female readers
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Free Publication For Female Writers & Content Creators',
                              style: Styles.h2(context).copyWith(
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),
                            Text(
                              'Follow us in social media and share our platform to your friends to explore our community',
                              style: Styles.body(context)
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Button(
                              label: 'BECOME A WRITER',
                              onPressed: () {},
                              paddingBlock: 12,
                              color: Colors.transparent,
                              borderColor: Colors.white,
                              labelColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Doubles.marginX(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // heading
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03),
                          child: Text(
                            '${'Help us a reach a larger audience'} ${Demoji.sun_behind_small_cloud}',
                            style: Styles.h1(context, color: Colors.white),
                          ),
                        ),
                      ),
    
                      // cover image
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.asset(Images.invite, fit: BoxFit.cover),
                        ),
                      ),
    
                      // actions
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '22,000 Readers +',
                                      style: Styles.h2(context).copyWith(
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.015,
                                    ),
                                    Text(
                                      'Follow us in social media and share our platform to your friends to explore our community',
                                      style: Styles.body(context)
                                          .copyWith(color: Colors.white),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                    Row(
                                      children: [
                                        Button(
                                          label: copyLinkText.toUpperCase(),
                                          paddingBlock: 12.0,
                                          labelColor: Colors.white,
                                          color: Colors.transparent,
                                          borderColor: Colors.white,
                                          onPressed: () async {
                                            await FlutterClipboard.copy(
                                                'https://sistaz-share.web.app');
                                            setState(
                                                () => copyLinkText = 'COPIED ✅');
                                          },
                                        ),
                                        const SizedBox(width: 20.0),
                                        // social media icons
                                        SeparatedRow(
                                          separatorBuilder: () =>
                                              const SizedBox(width: 20.0),
                                          children: List.generate(
                                            socialAccounts.length,
                                            (index) {
                                              return Image.asset(
                                                socialAccounts[index],
                                                color: Colors.white,
                                                height: 35.0,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Free Publication For Female Writers & Content Creators',
                                      style: Styles.h2(context).copyWith(
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.015,
                                    ),
                                    Text(
                                      'Follow us in social media and share our platform to your friends to explore our community',
                                      style: Styles.body(context)
                                          .copyWith(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.03,
                                    ),
                                    Button(
                                      label: 'BECOME A WRITER',
                                      paddingBlock: 12,
                                      color: Colors.transparent,
                                      borderColor: Colors.white,
                                      labelColor: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
