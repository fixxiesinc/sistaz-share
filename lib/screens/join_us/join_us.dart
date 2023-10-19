import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({Key? key}) : super(key: key);

  @override
  State<JoinUs> createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  String pincode = '';
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: 'Join Us | Sistaz Share',
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
                        vertical: Doubles.marginX(context)),
                    child: FractionallySizedBox(
                      widthFactor: isDesktop ? 0.6 : 1,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandablePageView(
                            controller: pageController,
                            children: const [SignUpForm(), ChooseCounsellor()],
                          ),
                          const Gap(50),
                          Obx(() {
                            return Button(
                              label: formController.currentStep.value == 0
                                  ? 'Next'
                                  : 'Done',
                              paddingBlock: 14,
                              paddingInline: 100,
                              maxWidth: isDesktop ? false : true,
                              labelSize: 14,
                              color: Colors.white,
                              onPressed: () async {
                                if (formController.currentStep.value == 0) {
                                  context.loaderOverlay.show();
                                  await Future.delayed(
                                    const Duration(seconds: 3), 
                                  );
                                  if (mounted) context.loaderOverlay.hide();

                                  // final String hashed =
                                  //     BCrypt.hashpw(pincode, BCrypt.gensalt());
                                  // FormController.pincode = hashed;

                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );

                                  formController.currentStep(1);
                                } else {
                                  router.go('/${Routes.chat}');
                                }
                              },
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
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
