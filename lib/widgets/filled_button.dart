import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const FilledButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(),
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
            return const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            );
          },
        ),
      ),
    );
  }
}
