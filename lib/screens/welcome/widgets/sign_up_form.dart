import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        bool isDesktop = sizingInformation.isDesktop;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
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
                    hintText: 'Pick a username',
                    hintStyle: Styles.body(context).textColor(Colors.grey),
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
                    hintText: 'Choose a pin code',
                    hintStyle: Styles.body(context).textColor(Colors.grey),
                  ),
                ),

                const CountrySelect(),
                const AgeGroupSelect(),
                const EducationSelect(),
                const GenderSelect(),
              ],
            ),
            const Gap(50),
            Button(
              label: 'Next',
              paddingBlock: 14,
              paddingInline: 100,
              maxWidth: isDesktop ? false : true,
              labelSize: 14,
              color: Colors.white,
              onPressed: () async {
                if (FormController.formValidated()) {
                  context.loaderOverlay.show();

                  FormController.secret =
                      Utils.generateHash(FormController.pincode);

                  if (mounted) context.loaderOverlay.hide();

                  formController.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
