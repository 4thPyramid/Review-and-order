import 'package:flutter/material.dart';
import 'package:review_app/core/theme/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: const BorderSide(
        color: AppColors.grey,
        width: 1,
      ),
      value: _value,
      onChanged: (newValue) {
        setState(() {
          _value = newValue!;
        });
      },
    );
  }
}
