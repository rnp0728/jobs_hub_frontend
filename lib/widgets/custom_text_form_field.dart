import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobs_hub/user/views/common/exports.dart';

InputDecoration inputDecoration(String label, [EdgeInsets? contentPadding]) {
  return InputDecoration(
    hintText: label,
    hintStyle: appstyle(14, Color(kDarkGrey.value), FontWeight.w500),
    errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.red, width: 0.5)),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.transparent, width: 0.5),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.red, width: 0.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(kDarkGrey.value), width: 0.5),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.transparent, width: 0.5),
    ),
    border: InputBorder.none,
  );
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? initialValue;
  final EdgeInsets? padding;
  final int maxLines;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final void Function()? onTap;
  final bool? readOnly;
  final TextInputType? textInputType;
  final bool isDateField;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final bool? enabled;
  final TextInputType? keyboardType;
  final int? maxLength;
  final InputDecoration? decorator;
  const CustomTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.initialValue,
    this.padding,
    this.maxLines = 1,
    this.obscureText = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.prefix,
    this.readOnly,
    this.textInputType,
    this.isDateField = false,
    this.focusNode,
    this.onEditingComplete,
    this.enabled = true,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.decorator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kLightGrey.value),
      child: TextFormField(
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        initialValue: initialValue,
        enabled: enabled,
        decoration: isDateField
            ? inputDecoration(label, padding).copyWith(
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                ),
                suffixIconColor: Color(kOrange.value),
              )
            : decorator ??
                inputDecoration(label, padding)
                    .copyWith(prefix: prefix)
                    .copyWith(prefix: prefix),
        style: appstyle(14, Color(kDark.value), FontWeight.w500),
        cursorColor: Color(kOrange.value),
        obscureText: obscureText,
        maxLines: maxLines,
        autovalidateMode: autovalidateMode,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap ?? () {},
        cursorHeight: 25,
        readOnly: readOnly ?? false,
        keyboardType: textInputType,
        onEditingComplete: onEditingComplete,
        maxLength: maxLength,
      ),
    );
  }

  CustomTextFormField copyWith({
    Key? key,
    String? label,
    TextEditingController? controller,
    String? initialValue,
    EdgeInsets? padding,
    int? maxLines,
    bool? obscureText,
    AutovalidateMode? autovalidateMode,
    String? Function(String? value)? validator,
    void Function(String value)? onChanged,
    void Function(String value)? onFieldSubmitted,
    void Function()? onTap,
    bool? readOnly,
    TextInputType? textInputType,
    bool isDateField = false,
    FocusNode? focusNode,
    Function()? onEditingComplete,
  }) {
    return CustomTextFormField(
      label: label ?? this.label,
      controller: controller ?? this.controller,
      initialValue: initialValue,
      padding: padding ?? this.padding,
      maxLines: maxLines ?? this.maxLines,
      obscureText: obscureText ?? this.obscureText,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      validator: validator ?? this.validator,
      onChanged: onChanged ?? this.onChanged,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onTap: onTap ?? this.onTap,
      readOnly: readOnly ?? this.readOnly,
      textInputType: textInputType ?? this.textInputType,
      isDateField: isDateField,
      focusNode: focusNode ?? this.focusNode,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
    );
  }
}
