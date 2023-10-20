import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      chatController.chats.add(const AIReply());
    });
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      chatController.chats.add(const UserReply(
        options: [
          'Self Esteem Issues',
          'Sexual Reproductive Issues',
          'Career Development Issues',
        ],
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: 'Chat | Sistaz Share',
      child: Scaffold(
        body: FutureBuilder<Counsellor?>(
            future: DatabaseService.fetchCounsellor(
                userController.user!.preferredCounsellor),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (snapshot.data == null) {
                return Center(
                  child: Text(
                    'Unable to fetch counsellor at this time',
                    style: Styles.body(context),
                  ),
                );
              }

              ChatController.counsellor = snapshot.data!;

              return ResponsiveBuilder(builder: (context, sizingInformation) {
                bool isMobile = sizingInformation.isMobile;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: Doubles.marginX(context),
                        vertical: isMobile ? 20 : 40,
                      ),
                      children: [
                        Obx(() {
                          return SeparatedColumn(
                            separatorBuilder: () => const Gap(20),
                            children: List.generate(chatController.chats.length,
                                (index) {
                              return chatController.chats[index];
                            }),
                          );
                        }),
                      ],
                    ),

                    // text field
                    Obx(
                      () {
                        return chatController.showKeyboard.value
                            ? const Entry(
                                opacity: 0,
                                yOffset: 200,
                                curve: Curves.easeOutCubic,
                                child: TextBox(),
                              )
                            : const SizedBox.shrink();
                      },
                    ),

                    // restart session button
                    Positioned(
                      right: Doubles.marginX(context) + 52,
                      child: Obx(() {
                        return chatController.showChatActionButtons.value
                            ? Entry(
                                opacity: 0,
                                yOffset: 200,
                                curve: Curves.easeOutCubic,
                                delay: const Duration(milliseconds: 2000),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Button(
                                    label: 'Click here to restart session',
                                    labelSize: 16,
                                    onPressed: () {},
                                  ),
                                ),
                              )
                            : const SizedBox.shrink();
                      }),
                    ),
                  ],
                );
              });
            }),
      ),
    );
  }
}




// - [x] Self Esteem Issues
// - [x] Sexual Reproductive Issues
// - [x] Career Development Issues

// Share your story..

// - [x] Self Esteem Issues | What might be the cause?
// * Academic Issues
// * Social Beauty Standards
// * Religious Guilt
// * Disapproval from Authority Figures
// * Divorced or Emotionally Distant Parents
// - Share your Story

// - [x] Divorced or Emotionally Distant Parents | How is it affecting you?
// * Mental Health disorder like depression or substance abuse
// * Low Self-Worth
// * Insecurity
// * Easily Distracted / Trouble Focusing

// - Tell me

// - [x] Sexual Reproductive Issues
// * Pregnancy scare?
// * Sexually Transmitted Infections or Disease Scare?
// * Thinking of Abortion?
// * Been Sexually Abused?

// - [x] Sexually abused
// + Were you forced or threatened?
// + How many times has this happen?
// + Were you physically harmed in any way?

// If anything, what do you remember during the incident?
// - Tell me

// - [x] Career Development Issues
// * Burnout
// * Not Enough Experience
// * Lack of Confidence
// * Changes in the industry

// - Tell me

// - [x] Burnout
// * Work-life Imbalance
// * Unclear Job Expectations
// * Dysfunctional Workplace Dynamics
// * Lack of Social Support

// - Tell me

// - [x] Work-life Imbalance
// * Having children
// * Increased Responsibility at Work and Home
// * Working Long Hours

// - Tell me
