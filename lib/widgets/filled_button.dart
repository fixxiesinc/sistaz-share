import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class ColoredButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const ColoredButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isDesktop = sizingInformation.isDesktop;
        return SizedBox(
          height: isDesktop ? 43 : 38,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
                (Set<MaterialState> states) {
                  return const EdgeInsets.symmetric(horizontal: 30.0);
                },
              ),
            ),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(letterSpacing: 0.5),
            ),
          ),
        );
      },
    );
  }
}
