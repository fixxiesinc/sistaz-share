import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class ChooseCounsellor extends StatefulWidget {
  const ChooseCounsellor({super.key});

  @override
  State<ChooseCounsellor> createState() => _ChooseCounsellorState();
}

class _ChooseCounsellorState extends State<ChooseCounsellor> {
  List<({String name, String image})> options = [
    (name: 'Aku', image: Images.avatar1),
    (name: 'Aku', image: Images.avatar2),
    (name: 'Aku', image: Images.avatar3),
    (name: 'Aku', image: Images.avatar4),
    (name: 'Aku', image: Images.avatar5),
    (name: 'Aku', image: Images.avatar6),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Text(
                'Choose preferred counsellor',
                style: Styles.h1(context, color: Colors.white),
              ),
              Gap(isMobile ? 20 : 30),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: 4,
                children: List.generate(options.length, (index) {
                  return CircleAvatar(
                    backgroundColor: const Color(0xFF333333),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        options[index].image,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
