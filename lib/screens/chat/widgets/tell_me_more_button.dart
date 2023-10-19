import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class TellMeMoreButton extends StatelessWidget {
  const TellMeMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatBox(
      radius: 1000,
      color: Colors.white,
      borderColor: Colors.white,
      onClick: () {
        if (chatController.showKeyboard.value) {
          chatController.showKeyboard(false);
        } else {
          chatController.showKeyboard(true);
        }
      },
      content: Padding(
        padding: const EdgeInsets.only(right: 12, bottom: 1),
        child: Center(
          child: Text(
            '${Demoji.bulb} I want to type',
            style: Styles.body(context).textColor(Colors.black),
          ),
        ),
      ),
    );
  }
}
