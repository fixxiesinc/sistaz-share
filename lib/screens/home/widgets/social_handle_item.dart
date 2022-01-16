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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
