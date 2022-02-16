import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

final GlobalKey<SliderMenuContainerState> menuKey =
    GlobalKey<SliderMenuContainerState>();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          Expanded(
            child: SliderMenuContainer(
              key: menuKey,
              hasAppBar: false,
              sliderMenu: const Menu(),
              appBarColor: Colors.transparent,
              slideDirection: SlideDirection.TOP_TO_BOTTOM,
              sliderMenuOpenSize: Get.size.height,
              sliderMain: ListView(
                shrinkWrap: true,
                children: const [
                  FirstBody(),
                  SizedBox(height: 60.0),
                  PageDivider(),
                  SizedBox(height: 60.0),
                  SecondBody(),
                  SizedBox(height: 60.0),
                  PageDivider(),
                  SizedBox(height: 60.0),
                  ThirdBody(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
