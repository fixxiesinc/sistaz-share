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
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
    final Size size = MediaQuery.of(context).size;
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
                              Theme.of(context).textTheme.headline5!.copyWith(
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
                          width: isDesktop ? size.width * 0.3 : null,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: nameController,
                                cursorColor: Colors.orange,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                                decoration: textfieldDecoration.copyWith(
                                  hintText: 'Full Name',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              TextField(
                                controller: countryController,
                                cursorColor: Colors.orange,
                                textCapitalization: TextCapitalization.words,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                                decoration: textfieldDecoration.copyWith(
                                  hintText: 'Country',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              TextFormField(
                                controller: emailController,
                                cursorColor: Colors.orange,
                                keyboardType: TextInputType.emailAddress,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                                decoration: textfieldDecoration.copyWith(
                                  hintText: 'Email',
                                  suffixIcon: const RequiredIcon(),
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .headline6!
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
                              ArgonButton(
                                borderRadius: 0,
                                color: Colors.white,
                                height: isDesktop ? 43 : 38,
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
                                            .button!
                                            .copyWith(letterSpacing: 0.5),
                                      ),
                                loader: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 2.0,
                                  ),
                                ),
                                onTap: (startLoading, stopLoading,
                                    btnState) async {
                                  if (_formKey.currentState!.validate()) {
                                    if (!detailsUploaded) {
                                      startLoading();
                                      EarlyAdopter earlyAdopter = EarlyAdopter(
                                        name: nameController.text,
                                        country: countryController.text,
                                        email: emailController.text,
                                      );
                                      var result =
                                          await DatabaseService.addNewAdopter(
                                        earlyAdopter,
                                      );
                                      if (result['state']) {
                                        stopLoading();
                                        setState(() => detailsUploaded = true);
                                        await Future.delayed(
                                          const Duration(seconds: 2),
                                        );
                                        pageProvider.pageController.nextPage(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                        );
                                        pageProvider.currentPage += 1;
                                      } else {
                                        stopLoading();
                                        Flushbar(
                                          message:
                                              'An error occurred. Please try again later',
                                          duration: const Duration(seconds: 5),
                                        ).show(context);
                                      }
                                    }
                                  }
                                },
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
                        style: Theme.of(context).textTheme.headline1,
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
}
