import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class LastBody extends StatelessWidget {
  const LastBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        return Material(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'the new disruption',
                  style: TextStyle(
                    wordSpacing: 1.5,
                    color: Colors.white,
                    fontFamily: Fonts.autography,
                    fontSize: isMobile
                        ? 44.0
                        : isTablet
                            ? MediaQuery.of(context).size.width * 0.09
                            : MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
                const SizedBox(height: 20.0),
                Link(
                  uri: Uri.parse('/${Routes.welcome}'),
                  builder: (context, followLink) {
                    return Button(
                        label: 'READ & TELL STORIES',
                        onPressed: () => followLink!(),
                        paddingBlock: 16,
                        paddingInline: 24,
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(letterSpacing: 0.5));
                  },
                ),
                const SizedBox(height: 60.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
