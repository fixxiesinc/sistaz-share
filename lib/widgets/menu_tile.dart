import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class MenuTile extends StatelessWidget {
  final String label;
  const MenuTile({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String url;
    if (label == 'Home') {
      url = '/';
    } else {
      url = '/${label.replaceAll(' ', '-').toLowerCase()}';
    }
    return Link(
      uri: Uri.parse(url),
      builder: (context, followLink) {
        return InkWell(
          onTap: () {
            menuProvider.menuOpen.value = false;
            viewController.currentPage(label);
            followLink!();
          },
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            label,
            style: Styles.h2(context).copyWith(
              color: label == viewController.currentPage.value
                  ? Colors.orange
                  : Colors.white,
            ),
          ),
        );
      },
    );
  }
}
