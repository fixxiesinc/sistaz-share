import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class StoryCategories extends StatefulWidget {
  const StoryCategories({Key? key}) : super(key: key);

  @override
  State<StoryCategories> createState() => _StoryCategoriesState();
}

class _StoryCategoriesState extends State<StoryCategories> {
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
