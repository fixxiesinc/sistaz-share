import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class WriterProfileCard extends StatefulWidget {
  final bool useWhiteTheme, allowClicking;
  final double? height;
  const WriterProfileCard({
    Key? key,
    this.height,
    this.useWhiteTheme = false,
    this.allowClicking = true,
  }) : super(key: key);

  @override
  State<WriterProfileCard> createState() => _WriterProfileCardState();
}

class _WriterProfileCardState extends State<WriterProfileCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: widget.height ?? MediaQuery.of(context).size.height * 0.1,
            height: widget.height ?? MediaQuery.of(context).size.height * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(Images.postPlaceholder, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: getValueForScreenType(
              context: context,
              mobile: 16,
              tablet: 20,
              desktop: 20,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Rose Abena',
                style: TextStyle(
                  fontSize: 22.0,
                  wordSpacing: 8.0,
                  letterSpacing: 2,
                  color: widget.useWhiteTheme ? Colors.white : null,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.autography,
                ),
              ),
              Text(
                'MD  ${Demoji.south_africa}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: widget.useWhiteTheme ? Colors.white : null,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
