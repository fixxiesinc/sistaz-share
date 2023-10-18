import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<({String name, String link})> socialAccounts = [
    (name: Images.pinterest, link: ''),
    (name: Images.facebook, link: 'https://web.facebook.com/sistazshare'),
    (name: Images.snapchat, link: ''),
    (name: Images.instagram, link: 'https://www.instagram.com/sistazshare'),
    (name: Images.linkedin, link: ''),
    (name: Images.twitter, link: 'https://twitter.com/sistazshare'),
  ];

  final List<String> items = [
    'Home',
    'Join Us',
    'Become a Counselor',
    'Our Story',
    'Contact',
    'Invite a Friend',
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.isMobile;
        return Material(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),

              // main body
              Expanded(
                child: SingleChildScrollView(
                  physics: isMobile
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                    horizontal: MediaQuery.of(context).size.width * 0.045,
                  ),
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: isMobile
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // menu list
                          SeparatedColumn(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder: () => SizedBox(
                              height: isMobile
                                  ? MediaQuery.of(context).size.height * 0.03
                                  : MediaQuery.of(context).size.height * 0.04,
                            ),
                            children: List.generate(
                              items.length,
                              (index) => MenuTile(label: items[index]),
                            ),
                          ),

                          Gap(MediaQuery.of(context).size.height * 0.08),

                          // social media icons
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            children: List.generate(
                              socialAccounts.length,
                              (index) {
                                return Link(
                                  target: LinkTarget.blank,
                                  uri: Uri.parse(socialAccounts[index].link),
                                  builder: (context, followLink) {
                                    return InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () => followLink!(),
                                      child: Image.asset(
                                        socialAccounts[index].name,
                                        height: 35.0,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),

                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.08),
                        ],
                      ),

                      // illustration
                      isMobile
                          ? const SizedBox.shrink()
                          : Image.asset(
                              Images.womanStraight,
                              height: MediaQuery.of(context).size.height * 0.6,
                            ),
                    ],
                  ),
                ),
              ),

              // fixxies copyright
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.035,
                  right: MediaQuery.of(context).size.width * 0.035,
                  bottom: isMobile
                      ? MediaQuery.of(context).size.height * 0.03
                      : MediaQuery.of(context).size.height * 0.04,
                  top: isMobile
                      ? MediaQuery.of(context).size.height * 0.02
                      : MediaQuery.of(context).size.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          // onTap: () => Utils.openLink(Strings.fixxiesUrl),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                Images.fixxiesLogo,
                                height: isMobile ? 12.0 : 16.0,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                '© 2023, Fixxies Inc',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isMobile ? 14.0 : 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
