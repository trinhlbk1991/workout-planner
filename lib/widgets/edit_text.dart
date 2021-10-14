import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infitness/theme/app_theme.dart';
import 'package:infitness/theme/colors.dart';
import 'package:infitness/theme/dimensions.dart';

class EditText extends StatelessWidget {
  final String? hint;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool readOnly;
  final bool autoFocus;
  final GestureTapCallback? onTap;
  final String? initialValue;

  EditText({
    this.hint,
    this.validator,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.autoFocus = false,
    this.onTap,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      initialValue: initialValue,
      enabled: !readOnly,
      autofocus: autoFocus,
      textCapitalization: TextCapitalization.sentences,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        contentPadding: EdgeInsets.only(
          left: Spacing.NORMAL,
          right: Spacing.NORMAL,
          top: Spacing.TINY,
          bottom: Spacing.TINY,
        ),
        fillColor: secondaryColor(context).withOpacity(0.1),
        focusColor: secondaryColor(context).withOpacity(0.1),
        hoverColor: secondaryColor(context).withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.DEFAULT),
          borderSide: BorderSide(color: _borderColor(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.DEFAULT),
          borderSide: BorderSide(color: _borderColor(context)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.DEFAULT),
          borderSide: BorderSide(color: _borderColor(context)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.DEFAULT),
          borderSide: BorderSide(color: _borderColor(context)),
        ),
      ),
    );
  }

  _borderColor(BuildContext context) {
    return secondaryColor(context).withOpacity(0.8);
  }
}
