import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FilledButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const FilledButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isDesktop = sizingInformation.isDesktop;
        return ElevatedButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(letterSpacing: 0.5),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
              (Set<MaterialState> states) {
                return EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: isDesktop ? 22.0 : 20.0,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
