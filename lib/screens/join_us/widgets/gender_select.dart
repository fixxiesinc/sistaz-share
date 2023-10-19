import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class GenderSelect extends StatefulWidget {
  const GenderSelect({super.key});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  String? selectedOption;

  final List<String> options = ['Male', 'Female', 'Non-binary'];

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
          'Gender',
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
          FormController.gender = value!;
        },
        items: List.generate(
          options.length,
          (index) {
            return DropdownMenuItem(
              value: options[index],
              child: Text(options[index],
                  style: Styles.body(context).textColor(Colors.grey)),
            );
          },
        ),
      ),
    );
  }
}
