import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class UserReply extends StatelessWidget {
  final List options;
  const UserReply({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Entry(
                opacity: 0,
                delay: const Duration(milliseconds: 3000),
                child: Obx(() {
                  return ChatBox(
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
                        children: List.generate(options.length, (index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              if (chatController.chatStarted) {
                                processNextQuestion(options[index]);
                                processNextChat();
                              } else {
                                chatController.chatStarted = true;

                                processNextQuestion(options[index]);

                                chatController.setDomain(options[index]);

                                processNextChat();
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      options[index],
                                      style: Styles.body(context).textColor(
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Gap(12),
                                  Icon(
                                    chatController.selectedDomains
                                            .contains(options[index])
                                        ? Icons.circle
                                        : Icons.circle_outlined,
                                    size: 16,
                                    color: chatController.selectedDomains
                                            .contains(options[index])
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
                  );
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF151515),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void processNextQuestion(String domain) {
    chatController.updateDomains(domain);
    if (chatController.questionPool[domain] != null) {
      chatController.questionToAsk =
          chatController.questionPool[domain]!.question;
    } else {
      chatController.questionToAsk = chatController
          .questionPool[chatController.questionToAsk]!.nextQuestion!;
    }
  }

  void processNextChat() {
    String question = chatController.questionToAsk;

    final options = chatController.questionPool[question]!.options;
    final widget = UserReply(options: options);

    chatController.chats.add(const AIReply());
    Future.delayed(const Duration(milliseconds: 1000));
    chatController.chats.add(widget);
  }
}
