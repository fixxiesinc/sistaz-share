import 'package:flutter/material.dart';

class SocialHandleItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const SocialHandleItem({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
