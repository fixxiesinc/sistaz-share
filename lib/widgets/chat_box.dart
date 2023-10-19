import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final Widget content;
  final Color? color, borderColor;
  final double? radius, horizontalPadding, verticalPadding;
  final VoidCallback? onClick;
  const ChatBox({
    Key? key,
    required this.content,
    this.color,
    this.borderColor,
    this.radius,
    this.horizontalPadding,
    this.verticalPadding,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 12,
          horizontal: horizontalPadding ?? 18,
        ),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 12.0),
        ),
        child: content,
      ),
    );
  }
}
