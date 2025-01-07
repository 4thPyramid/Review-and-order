import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';

import '../logic/forget_password/forget_password_cubit.dart';
import '../logic/forget_password/forget_password_state.dart';
import '../widgets/otp_input.dart';
import '../widgets/verify_code_form.dart';
import '../widgets/welcom_login_text.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key, required this.email});
final String email;
  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(bottom: 16.h,top: 60.h, right: 16.h, left: 16.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              SizedBox(height: 20.h),
              const WelcomAuthText(
                title: "أدخل رمز التحقق",
                subTitle: " دخل الرمز الذي أرسلناه إليك",
              ),
              SizedBox(height: 20.h),
              VerifyCodeForm(email: widget.email,),
            ],
          ),
        ),
      ),
    );
  }
}
