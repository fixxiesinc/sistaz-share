import 'package:flutter/material.dart';

class SocialHandleItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const SocialHandleItem({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }
}
