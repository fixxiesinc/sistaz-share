import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class UserReply extends StatefulWidget {
  final List options;
  final VoidCallback? onSelect;
  const UserReply({super.key, required this.options, this.onSelect});

  @override
  State<UserReply> createState() => _UserReplyState();
}

class _UserReplyState extends State<UserReply> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // user response message
              Flexible(
                child: Entry(
                  opacity: 0,
                  delay: const Duration(milliseconds: 1500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ChatBox(
                        radius: 20,
                        color: const Color(0xFF151515),
                        borderColor: const Color(0xFF333333),
                        onClick: null,
                        content: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SeparatedColumn(
                            separatorBuilder: () => const Gap(14),
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:
                                List.generate(widget.options.length, (index) {
                              bool selected =
                                  selectedOption == widget.options[index];

                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    selectedOption = widget.options[index];
                                  });

                                  if (chatController.chatStarted) {
                                    var res = processNextQuestion(
                                        widget.options[index]);
                                    if (res) {
                                      processNextChat();
                                    } else {
                                      chatController.questionToAsk =
                                          'Do you want to say more?';

                                      chatController.chats.add(const AIReply());
                                      await Future.delayed(
                                        const Duration(milliseconds: 1500),
                                      );

                                      chatController.chats.add(
                                        const WantToSayMore(),
                                      );
                                    }
                                  } else {
                                    chatController.chatStarted = true;

                                    processNextQuestion(widget.options[index]);

                                    chatController
                                        .setDomain(widget.options[index]);

                                    processNextChat();
                                  }

                                  if (widget.onSelect != null) {
                                    widget.onSelect!();
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          widget.options[index],
                                          textAlign: TextAlign.end,
                                          style: Styles.body(context).textColor(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Gap(12),
                                      Icon(
                                        selected
                                            ? Icons.circle
                                            : Icons.circle_outlined,
                                        size: 16,
                                        color: selected
                                            ? Colors.orange
                                            : Colors.white70,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),

                      const Gap(12),

                      // tell me more
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          const TellMeMoreButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // user avatar
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFF151515),
                  // child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(1000),
                  //     child: RandomAvatar(
                  //       userController.user!.username,
                  //       trBackground: true,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool processNextQuestion(String domain) {
    chatController.answers.add(domain);

    if (chatController.questionPool[domain] != null) {
      chatController.questionToAsk =
          chatController.questionPool[domain]!.question;

      chatController.questionsAnswered.add(chatController.questionToAsk);

      return true;
    } else {
      if (chatController
              .questionPool[chatController.questionToAsk]!.nextQuestion !=
          null) {
        chatController.questionToAsk = chatController
            .questionPool[chatController.questionToAsk]!.nextQuestion!;

        chatController.questionsAnswered.add(chatController.questionToAsk);

        return true;
      } else {
        return false;
      }
    }
  }

  void processNextChat() {
    String question = chatController.questionToAsk;

    late List options;
    if (chatController.questionPool[question] != null) {
      options = chatController.questionPool[question]!.options;
    } else {
      options = ['No responses found'];
    }
    final widget = UserReply(options: options);

    chatController.chats.add(const AIReply());
    Future.delayed(const Duration(milliseconds: 1000));
    chatController.chats.add(widget);
  }
}
