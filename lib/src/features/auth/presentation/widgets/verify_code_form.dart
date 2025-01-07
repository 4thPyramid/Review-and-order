
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/routes/router_names.dart';
import '../logic/forget_password/forget_password_cubit.dart';
import '../logic/forget_password/forget_password_state.dart';
import 'otp_input.dart';

class VerifyCodeForm extends StatefulWidget {
  final String email;
  
  const VerifyCodeForm({
    super.key,
    required this.email,
  });

  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  String? _otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          verifyCodeLoaded: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.green,

              ),
            );
            context.go(RouterNames.resetPassword,extra: {'email': widget.email, 'code': _otpCode});
          },
          verifyCodeerror: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.message)),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            OtpInput(
              onCompleted: (otp) {
                setState(() {
                  _otpCode = otp;
                  print("//-------------->$_otpCode");
                });
              },
            ),
            SizedBox(height: 40.h),
            CustomButton(
              text: state.maybeWhen(
                verifyCodeLoading: () => "جاري الارسال...",
                orElse: () => "تـاكـيـد",
              ),
              onPressed:  () {
                    context.read<ForgetPasswordCubit>()
                      .verifyCode(widget.email, _otpCode!);
                  },
            ),
          ],
        );
      },
    );
  }
}

