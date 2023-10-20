import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class AgeGroupSelect extends StatefulWidget {
  const AgeGroupSelect({super.key});

  @override
  State<AgeGroupSelect> createState() => _AgeGroupSelectState();
}

class _AgeGroupSelectState extends State<AgeGroupSelect> {
  String? selectedOption;

  final List<String> options = ['15 - 20', '20 - 25', '25 - 30'];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        hint: Text(
          'Age Group',
          style: Styles.body(context)
              .textColor(Colors.grey)
              .copyWith(fontFamily: Fonts.mazzard),
        ),
        value: selectedOption,
        style: Styles.body(context).copyWith(fontFamily: Fonts.mazzard),
        decoration: inputDecoration.copyWith(
          contentPadding: const EdgeInsets.only(left: 0),
        ),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -18),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF333333)),
            boxShadow: const [BoxShadow(color: Colors.transparent)],
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(CupertinoIcons.chevron_down, size: 20),
        ),
        onChanged: (value) {
          setState(() => selectedOption = value);
          FormController.ageGroup = value!;
        },
        items: List.generate(
          options.length,
          (index) {
            return DropdownMenuItem(
              value: options[index],
              child: Text(options[index], style: Styles.body(context)),
            );
          },
        ),
      ),
    );
  }
}
