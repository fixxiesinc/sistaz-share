import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String pincode = '';

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: 'Sign Up',
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;
          bool isDesktop = sizingInformation.isDesktop;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Doubles.marginX(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: Doubles.marginX(context),
                    ),
                    child: FractionallySizedBox(
                      widthFactor: isDesktop ? 0.6 : 1,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandablePageView(
                            controller: formController.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [SignUpForm(), ChooseCounsellor()],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // illustration
                Expanded(
                  flex: isDesktop ? 1 : 0,
                  child: Visibility(
                    visible: isDesktop ? true : false,
                    child: Transform.flip(
                      flipX: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Doubles.marginX(context)),
                        child: Image.asset(
                          Images.woman,
                          width: isMobile
                              ? MediaQuery.of(context).size.width * 0.8
                              : MediaQuery.of(context).size.width * 0.3,
                          height: isMobile
                              ? MediaQuery.of(context).size.width * 0.8
                              : MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
