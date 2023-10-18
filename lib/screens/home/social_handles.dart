import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SocialHandles extends StatelessWidget {
  const SocialHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // instagram
            const SocialHandleItem(
              label: 'Instagram',
              link: Urls.instagram,
            ),
            Container(
              height: 1.5,
              color: Colors.white,
              width: isMobile
                  ? double.infinity
                  : MediaQuery.of(context).size.width * 0.3,
            ),
            const SizedBox(height: 20.0),

            // facebook
            const SocialHandleItem(
              label: 'Facebook',
              link: Urls.facebook,
            ),
            Container(
              height: 1.5,
              color: Colors.white,
              width: isMobile
                  ? double.infinity
                  : MediaQuery.of(context).size.width * 0.3,
            ),
            const SizedBox(height: 20.0),

            // twitter
            const SocialHandleItem(
              label: 'Twitter',
              link: Urls.twitter,
            ),
            Container(
              height: 1.5,
              color: Colors.white,
              width: isMobile
                  ? double.infinity
                  : MediaQuery.of(context).size.width * 0.3,
            ),
            const SizedBox(height: 20.0),

            // get in touch
            InkWell(
              onTap: () => context.go('/${Routes.contact}'),
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
