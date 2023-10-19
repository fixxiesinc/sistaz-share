import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class AIReply extends StatelessWidget {
  const AIReply({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF151515),
            child: ClipRRect(
              child: Image.asset(
                Images.avatar1,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 2000)),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const TypingIndicator(showIndicator: true);
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Entry(
                    opacity: 0,
                    scale: 0.7,
                    child: ChatBox(
                      radius: 100,
                      color: const Color(0xFF151515),
                      borderColor: const Color(0xFF333333),
                      content: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          chatController.questionToAsk,
                          style: Styles.body(context),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
