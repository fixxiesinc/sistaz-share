import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SocialHandleItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const SocialHandleItem({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
