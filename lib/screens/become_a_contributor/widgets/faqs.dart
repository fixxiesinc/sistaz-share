import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  final faqs = [
    FAQTile(
      title: 'Who can be called a contributor on Sistaz Share',
      content: Container(
        height: 100.0,
        color: Colors.red[200],
      ),
    ),
    FAQTile(
      title: 'Who can be called a contributor on Sistaz Share',
      content: Container(
        height: 100.0,
        color: Colors.orange[200],
      ),
    ),
    FAQTile(
      title: 'Who can be called a contributor on Sistaz Share',
      content: Container(
        height: 100.0,
        color: Colors.yellow[200],
      ),
    ),
    FAQTile(
      title: 'Who can be called a contributor on Sistaz Share',
      content: Container(
        height: 100.0,
        color: Colors.green[200],
      ),
    ),
    FAQTile(
      title: 'Who can be called a contributor on Sistaz Share',
      content: Container(
        height: 100.0,
        color: Colors.blue[200],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      mainAxisSize: MainAxisSize.min,
      separatorBuilder: () => const SizedBox(height: 8.0),
      children: List.generate(faqs.length, (index) => faqs[index]),
    );
  }
}
