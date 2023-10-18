import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FAQTile extends StatefulWidget {
  final String title;
  final Widget content;
  const FAQTile({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  final ExpandableController expandableController = ExpandableController();

  @override
  void dispose() {
    expandableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: expandableController,
      child: ScrollOnExpand(
        child: ExpandablePanel(
          expanded: Column(
            children: [widget.content, const FAQDiv()],
          ),
          header: GestureDetector(
            onTap: () {
              expandableController.toggle();
              setState(() {});
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    expandableController.expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12.0),
                  Flexible(
                    child: Text(
                      widget.title,
                      style: Styles.body(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          collapsed: const FAQDiv(),
          theme: const ExpandableThemeData(
            hasIcon: false,
            tapBodyToCollapse: true,
          ),
        ),
      ),
    );
  }
}
