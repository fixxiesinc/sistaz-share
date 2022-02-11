import 'package:flutter/material.dart';

class RequiredIcon extends StatelessWidget {
  const RequiredIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Text(
        '*',
        style: TextStyle(fontSize: 18.0, color: Colors.grey),
      ),
    );
  }
}
