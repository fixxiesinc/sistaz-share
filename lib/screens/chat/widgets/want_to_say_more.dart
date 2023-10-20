import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class WantToSayMore extends StatefulWidget {
  const WantToSayMore({super.key});

  @override
  State<WantToSayMore> createState() => _WantToSayMoreState();
}

class _WantToSayMoreState extends State<WantToSayMore> {
  String? response;

  List<String> options = ['Yes', 'No, that\'s all for now'];

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
            // user response message
            Flexible(
              child: Entry(
                opacity: 0,
                delay: const Duration(milliseconds: 1000),
                child: ChatBox(
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
                          onTap: () async {
                            setState(() => response = options[index]);

                            if (response == 'Yes') {
                              chatController.showKeyboard(true);
                            } else {
                              chatController.processChatClosure();
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
                                  response == options[index]
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  size: 16,
                                  color: response == options[index]
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
              ),
            ),

            // user avatar
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xFF151515),
                child: Text(
                  userController.user!.username[0].toUpperCase(),
                  style: Styles.body(context),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
