import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class SocialHandleItem extends StatelessWidget {
  final String label, link;
  const SocialHandleItem({Key? key, required this.label, required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(link),
      target: LinkTarget.blank,
      builder: (context, followLink) {
        return InkWell(
          onTap: followLink,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        );
      },
    );
  }
}
