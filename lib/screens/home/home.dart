import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 20.0),
              children: const [FirstBody(), SecondBody()],
            ),
          ),
        ],
      ),
    );
  }
}
