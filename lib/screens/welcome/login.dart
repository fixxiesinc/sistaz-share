import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String pincode = '';

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: 'Login',
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
                          Text(
                            'Log In',
                            style: Styles.h1(context, color: Colors.white),
                          ),
                          Gap(isMobile ? 20 : 30),
                          SeparatedColumn(
                            separatorBuilder: () => const Gap(30),
                            children: [
                              // username
                              TextField(
                                cursorColor: Colors.white,
                                style: Styles.body(context),
                                onChanged: (value) {
                                  FormController.username = value;
                                },
                                decoration: inputDecoration.copyWith(
                                  hintText: 'Username',
                                  hintStyle: Styles.body(context)
                                      .textColor(Colors.grey),
                                ),
                              ),

                              // pin code
                              TextField(
                                obscureText: true,
                                cursorColor: Colors.white,
                                style: Styles.body(context),
                                onChanged: (value) {
                                  FormController.pincode = value;
                                },
                                decoration: inputDecoration.copyWith(
                                  hintText: 'Pin code',
                                  hintStyle: Styles.body(context)
                                      .textColor(Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          const Gap(50),
                          Button(
                            label: 'Enter',
                            labelSize: 14,
                            paddingBlock: 14,
                            paddingInline: 100,
                            maxWidth: isDesktop ? false : true,
                            color: Colors.white,
                            onPressed: () async {
                              if (FormController.username.isNotEmpty &&
                                  FormController.pincode.isNotEmpty) {
                                context.loaderOverlay.show();

                                final res = await DatabaseService.fetchUser();

                                if (mounted) context.loaderOverlay.hide();

                                if (res != null) {
                                  userController.user = res;
                                  router.go('/${Routes.chat}');
                                } else {
                                  if (mounted) {
                                    Utils.showToast(
                                        context, 'No account found');
                                  }
                                }
                              }
                            },
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
