import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';
import 'package:another_flushbar/flushbar.dart';

class GetNotified extends StatefulWidget {
  const GetNotified({Key? key}) : super(key: key);

  @override
  State<GetNotified> createState() => _GetNotifiedState();
}

class _GetNotifiedState extends State<GetNotified> {
  bool detailsUploaded = false;
  final _formKey = GlobalKey<FormState>();
  final PageProvider pageProvider = Get.find();
  final ScrollController scrollController = ScrollController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    scrollController.dispose();
    nameController.dispose();
    countryController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent - 5 &&
          !scrollController.position.outOfRange) {
        pageProvider.pageController.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;
          bool isTablet = sizingInformation.isTablet;
          bool isDesktop = sizingInformation.isDesktop;
          return Padding(
            padding: EdgeInsets.only(
              left: isMobile ? 20.0 : 60.0,
              right: isMobile ? 20.0 : 60.0,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              // physics: const NeverScrollableScrollPhysics(),
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: isMobile
                            ? 20.0
                            : isTablet
                                ? 40.0
                                : Get.height * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Be the first to get notified when we go live',
                          style:
                              Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    color: Colors.white,
                                    fontFamily: Fonts.mazzard,
                                  ),
                          children: const [
                            TextSpan(
                              text: ' !',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
                        child: SizedBox(
                          width: isDesktop ? Get.width * 0.3 : null,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // full name
                              TextFormField(
                                controller: nameController,
                                cursorColor: Colors.orange,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white),
                                onFieldSubmitted: (value) async {
                                  await saveData();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This is a required field';
                                  }
                                  return null;
                                },
                                decoration: textfieldDecoration.copyWith(
                                  hintText: 'Full Name',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 30.0),

                              // country
                              TextFormField(
                                controller: countryController,
                                cursorColor: Colors.orange,
                                textCapitalization: TextCapitalization.words,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white),
                                onFieldSubmitted: (value) async {
                                  await saveData();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This is a required field';
                                  }
                                  return null;
                                },
                                decoration: textfieldDecoration.copyWith(
                                  hintText: 'Country',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 30.0),

                              // email
                              TextFormField(
                                controller: emailController,
                                cursorColor: Colors.orange,
                                keyboardType: TextInputType.emailAddress,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white),
                                onFieldSubmitted: (value) async {
                                  await saveData();
                                },
                                decoration: textfieldDecoration.copyWith(
                                  hintText: 'Email',
                                  suffixIcon: const RequiredIcon(),
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.grey),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This is a required field';
                                  } else if (!EmailValidator.validate(value)) {
                                    return 'Invalid email address';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 50.0),

                              // send button
                              Row(
                                children: [
                                  RoundedLoadingButton(
                                    controller: _btnController,
                                    successColor: Colors.white,
                                    color: Colors.white,
                                    valueColor: Colors.black,
                                    height: isDesktop ? 43 : 38,
                                    animateOnTap: false,
                                    borderRadius: _btnController.currentState ==
                                            ButtonState.idle
                                        ? 0
                                        : 1000,
                                    onPressed: () async => await saveData(),
                                    width: Get.width *
                                        (isDesktop
                                            ? 0.077
                                            : isTablet
                                                ? 0.2
                                                : 0.25),
                                    child: detailsUploaded
                                        ? const Icon(Icons.check)
                                        : Text(
                                            'SEND',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(letterSpacing: 0.5),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 60.0),
                    ],
                  ),
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        Demoji.lipstick,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  Future<void> saveData() async {
    if (_formKey.currentState!.validate()) {
      if (!detailsUploaded) {
        _btnController.start();
        setState(() => detailsUploaded = true);

        EarlyAdopter record = EarlyAdopter(
          name: nameController.text.trim(),
          country: countryController.text.trim(),
          email: emailController.text.trim(),
        );

        var result = await DatabaseService.addNewAdopter(record);
        if (result['state']) {
          _btnController.stop();
          _btnController.success();

          setState(() => detailsUploaded = true);
          await Future.delayed(const Duration(seconds: 2));
          pageProvider.pageController.nextPage(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeIn,
          );
          pageProvider.currentPage += 1;
        } else {
          _btnController.error();
          Flushbar(
            message: 'An error occurred. Please try again later',
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      }
    }
  }
}
