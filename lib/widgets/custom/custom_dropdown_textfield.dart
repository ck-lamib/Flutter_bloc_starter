import 'package:clean_folder_str/utils/theme/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;

  final Widget? suffixIcon;

  final String? Function(String?)? validator;

  final Color? fillColor;

  final bool? autofocus;
  final String? labelText;

  final Function()? onTap;

  final TextStyle? hintStyle;
  final Widget? prefixIcon;

  final EdgeInsetsGeometry? contentPadding;

  // final int? maxLines;
  final List<DropdownMenuItem<String>> dropDownItemLists;
  final String? itemValue;

  const CustomDropdownTextField({
    super.key,
    this.fillColor,
    required this.hint,
    this.suffixIcon,
    this.onValueChange,
    this.validator,
    this.onTap,
    this.autofocus = false,
    this.focusNode,
    this.labelText,
    this.prefixIcon,
    this.hintStyle,
    this.contentPadding,
    required this.dropDownItemLists,
    this.itemValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        alignment: Alignment.topLeft,
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.zero,
        ),
        value: itemValue,
        items: dropDownItemLists,
        focusNode: focusNode,
        autofocus: autofocus!,
        validator: (validator != null) ? validator : null,
        onChanged: (text) {
          if (onValueChange != null) {
            onValueChange!(text!);
          }
        },
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          openInterval: const Interval(
            0,
            0.9,
            curve: Curves.easeIn,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
        ),
        iconStyleData: const IconStyleData(
          iconEnabledColor: MyAppColors.primarycolor,
        ),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          label: labelText != null
              ? Text(
                  labelText ?? "",
                )
              : null,
          fillColor: fillColor,
          filled: false,
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: hintStyle,
        ),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: MyAppColors.textcolor,
            ),
      ),
    );
  }
}
