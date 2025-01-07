import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/reset_password_form.dart';
import '../widgets/welcom_login_text.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.email, required this.code});
final String email;
final String code;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(bottom: 16.h, top: 60.h, right: 16.h, left: 16.h),
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
                title: "انشاء كلمه مرور جديده",
                subTitle: "قم بانشاء كلمه المرور الجديده لتسجيل الدخول  ",
              ),
              SizedBox(height: 20.h),
              ResetPasswordForm(
                email: widget.email,
                code: widget.code,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
