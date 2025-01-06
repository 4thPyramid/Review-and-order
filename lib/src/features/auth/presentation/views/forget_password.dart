import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/src/features/auth/presentation/components/forget_password_form.dart';
import 'package:review_app/src/features/auth/presentation/widgets/forget_password_tapbar.dart';
import 'package:review_app/src/features/auth/presentation/widgets/welcom_login_text.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                title: "نسيت كلمة السر؟",
                subTitle:
                    "أدخل بريدك الإلكتروني أو رقم هاتفك، وسنرسل لك  رمز التحقق",
              ),
              ForgetPasswordTapBar(tabController: _tabController),
              SizedBox(height: 20.h),
              ForgetPasswordForm(
                tabController: _tabController,
                phoneController: _phoneController,
                emailController: _emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
