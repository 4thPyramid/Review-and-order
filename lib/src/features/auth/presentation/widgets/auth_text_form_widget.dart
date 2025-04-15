import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/common/widgets/custom_text_form_field.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_styles.dart';

class AuthTextFieldWidget extends StatefulWidget {
  const AuthTextFieldWidget({
    super.key,
    this.titelOfField,
    this.controller,
    required this.isPassword,
    required this.hintText,
    this.prefixIcon,
    this.validator,
  });
  final String? titelOfField;
  final TextEditingController? controller;
  final bool isPassword;
  final String hintText;
  final IconData? prefixIcon;
  final FormFieldValidator<String>? validator;

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  bool _isPasswordVisiable = false;
  void _togglePassword() {
    print("Toggle password pressed");
    setState(() {
      _isPasswordVisiable = !_isPasswordVisiable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text(
            widget.titelOfField ?? '',
            style: AppStyles.s16.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          controller: widget.controller,
          isPassword: widget.isPassword,
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon),
          validator: widget.validator,
          obscureText: widget.isPassword ? !_isPasswordVisiable : false,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: _togglePassword,
                  icon: Icon(
                    _isPasswordVisiable
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
