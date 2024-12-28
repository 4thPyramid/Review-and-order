import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';

class CustomOtpFilds extends StatelessWidget {
  const CustomOtpFilds({
    super.key,
    required this.controllers,
    required this.validator,
  });
  final List<TextEditingController> controllers;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      6,
      (index) => SizedBox(
        width: 50.w,
        child: TextFormField(
          controller: controllers[index],
          validator: validator,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            border: const OutlineInputBorder(),
            fillColor: AppColors.lightGrey,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.lightGrey),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(8)),
            counterText: "",
          ),
        ),
      ),
    ));
  }
}
