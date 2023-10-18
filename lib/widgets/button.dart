import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Button extends StatelessWidget {
  final String label;
  final Color? borderColor, color, labelColor;
  final double? paddingInline, paddingBlock, labelSize;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  const Button({
    Key? key,
    required this.label,
    this.paddingInline,
    this.paddingBlock,
    this.labelSize,
    required this.onPressed,
    this.textStyle,
    this.borderColor,
    this.color,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(6),
            color: color ?? Colors.white),
        padding: EdgeInsets.symmetric(
          vertical: paddingBlock ?? 20.0,
          horizontal: paddingInline ?? 18.0,
        ),
        child: Text(
          label,
          style: textStyle ??
              Styles.button
                  .textColor(labelColor ?? Colors.black)
                  .size(labelSize ?? 12),
        ),
      ),
    );
  }
}
