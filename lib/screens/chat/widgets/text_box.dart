import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class TextBox extends StatefulWidget {
  const TextBox({super.key});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  String text = '';
  final controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (focusNode.hasFocus == false) {
      chatController.showKeyboard(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      bool isMobile = sizingInformation.isMobile;
      bool isDesktop = sizingInformation.isDesktop;
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
          left: isMobile ? Doubles.marginX(context) : 0,
          right: isMobile ? Doubles.marginX(context) : 0,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: FractionallySizedBox(
          widthFactor: isDesktop ? 0.5 : null,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 4 : 10,
              horizontal: isMobile ? 8 : 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: const Color(0xFF333333)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: LimitedBox(
                    maxHeight: isMobile ? 100 : 200,
                    child: Padding(
                      padding: EdgeInsets.only(left: text.length > 30 ? 12 : 0),
                      child: TextField(
                        autofocus: true,
                        maxLines: null,
                        controller: controller,
                        cursorColor: Colors.orange,
                        style: Styles.body(context),
                        onChanged: (value) => setState(() => text = value),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Here ...',
                          hintStyle:
                              Styles.body(context).textColor(Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(12),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () async {
                    chatController.typedMessage = text;

                    addMessageToChat();

                    chatController.showKeyboard(false);

                    chatController.processChatClosure();
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        text.isEmpty ? const Color(0xFF333333) : Colors.white,
                    child: Icon(
                      CupertinoIcons.paperplane,
                      size: 20,
                      color: text.isEmpty ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void addMessageToChat() {
    controller.clear();
    final message = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: ChatBox(
            radius: 20,
            color: const Color(0xFF151515),
            borderColor: const Color(0xFF333333),
            content: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 4,
                bottom: 4,
              ),
              child: Text(text, style: Styles.body(context)),
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
            //   borderRadius: BorderRadius.circular(1000),
            //   child: RandomAvatar(
            //     userController.user!.username,
            //     trBackground: true,
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
        ),
      ],
    );
    chatController.chats.add(message);
    setState(() => text = '');
  }
}
