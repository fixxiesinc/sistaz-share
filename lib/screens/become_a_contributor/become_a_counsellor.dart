import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class BecomeACounsellor extends StatefulWidget {
  const BecomeACounsellor({Key? key}) : super(key: key);

  @override
  State<BecomeACounsellor> createState() => _BecomeACounsellorState();
}

class _BecomeACounsellorState extends State<BecomeACounsellor> {
  late FlickManager flickManager;
  final List<String> links = ['TERMS', 'PRIVACY', 'DMCA'];

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/sistaz-share.appspot.com/o/defaults%2Fwave.mp4?alt=media&token=24c1bfff-63c4-4dfa-9012-215cea077515',
        ),
      )..setLooping(true),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: 'Become a Counsellor | Sistaz Share',
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final isMobile = sizingInformation.isMobile;
          return ListView(
            children: [
              // we publish stories
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: isMobile
                        ? MediaQuery.of(context).size.height * 0.015
                        : MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: isMobile ? 1 : 0.9,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'We publish stories and perspectives on educating and',
                          style: Styles.h1(context)
                              .textColor(Colors.white)
                              .copyWith(height: 1.2),
                          children: [
                            TextSpan(
                              text: ' empowering',
                              style: Styles.h1(context).textColor(Colors.white),
                            ),
                            TextSpan(
                              text: ' women',
                              style: Styles.h1(context)
                                  .textColor(Colors.white)
                                  .copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                            TextSpan(
                              text: '\n\n${Demoji.rainbow}',
                              style: Styles.h1(context)
                                  .textColor(Colors.white)
                                  .copyWith(height: isMobile ? 0.6 : 0.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // vertical divider
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile
                            ? MediaQuery.of(context).size.height * 0.06
                            : MediaQuery.of(context).size.height * 0.08,
                      ),
                      child: SizedBox(
                        height: isMobile
                            ? MediaQuery.of(context).size.height * 0.4
                            : MediaQuery.of(context).size.height * 0.3,
                        child: const VerticalDivider(
                          thickness: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // wave, faqs, sign up button
              Container(
                color: Colors.black,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(
                  left: isMobile ? 0 : MediaQuery.of(context).size.width * 0.03,
                  right:
                      isMobile ? 0 : MediaQuery.of(context).size.width * 0.03,
                  top: isMobile
                      ? MediaQuery.of(context).size.width * 0.07
                      : MediaQuery.of(context).size.width * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                    // wave video
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: FlickVideoPlayer(
                        flickManager: flickManager,
                        flickVideoWithControls: const FlickVideoWithControls(
                          videoFit: BoxFit.fill,
                          controls: SizedBox.shrink(),
                          playerLoadingFallback: SizedBox.shrink(),
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                    // faqs section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile
                            ? MediaQuery.of(context).size.width * 0.07
                            : MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              'Contributing to Sistaz Share',
                              style: Styles.h1(context)
                                  .copyWith(color: Colors.orange),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Flex(
                            direction:
                                isMobile ? Axis.vertical : Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: isMobile
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: isMobile ? 0 : 1,
                                child: const FAQs(),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                              Expanded(
                                flex: isMobile ? 0 : 1,
                                child: const Attestations(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                    // call to action
                    Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: isMobile ? null : 0.45,
                          child: Text(
                            'We imagine an e - community of stimulated voices on improving women\'s lives by sharing engaging socially driven content for the world to indulge',
                            textAlign: TextAlign.center,
                            style: Styles.body(context).copyWith(
                              color: Colors.orange,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Center(
                          child: Button(
                            label: 'SIGN UP',
                            onPressed: () {},
                            color: Colors.orange,
                            paddingInline: 30,
                            paddingBlock: 12,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
