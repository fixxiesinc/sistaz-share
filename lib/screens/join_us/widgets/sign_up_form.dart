import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
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
          ],
        );
      },
    );
  }
}
