import 'package:flutter/material.dart';

class SocialHandles extends StatelessWidget {
  const SocialHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          child: const Text(
            'Twitter',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
