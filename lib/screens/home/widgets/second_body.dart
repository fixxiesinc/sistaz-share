import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SecondBody extends StatelessWidget {
  const SecondBody({Key? key}) : super(key: key);

  final String caption =
      '''Sistaz Share publishes social, lifestyle and personal development content - that highlight stories relatable to the feminine endeavor''';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isMobile = sizingInformation.isMobile;
        final bool isTablet = sizingInformation.isTablet;
        final bool isDesktop = sizingInformation.isDesktop;
        return Material(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(
              left: isMobile ? 20.0 : 60.0,
              // right: isMobile ? 20.0 : 60.0,
              bottom: 60.0,
              top: isMobile
                  ? 20.0
                  : isTablet
                      ? 40.0
                      : 60.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Our',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.orange,
                            fontFamily: Fonts.mazzard,
                            fontStyle: FontStyle.italic,
                          ),
                          children: [
                            TextSpan(
                              text: '  Editorial',
                              style: TextStyle(fontStyle: FontStyle.normal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        caption,
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Expanded(flex: 6, child: Categories()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.65,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index == categories.length - 1 ? 60.0 : 30.0,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.height * 0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey[900],
                    width: size.height * 0.5,
                    height: size.height * 0.4,
                    child: category.image,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    category.label,
                    style: const TextStyle(
                      fontSize: 22.0,
                      letterSpacing: 1.3,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    children: category.subCategories.map((subCategory) {
                      return Text(
                        subCategory,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
