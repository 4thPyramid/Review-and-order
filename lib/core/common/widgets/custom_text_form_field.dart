import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final void Function()? toggeleObscure;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,
    this.isPassword = false,
    this.toggeleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 18.0.w,
              horizontal: 12.0.w,
            ),
            hintText: hintText,
            hintStyle: AppStyles.s12,
            fillColor: fillColor ?? AppColors.white,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 207, 205, 205)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(15.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.errorColor),
              borderRadius: BorderRadius.circular(15.0),
            )),
        validator: validator ?? (value) => null,
        maxLines: maxLines,
      ),
    );
  }
}
