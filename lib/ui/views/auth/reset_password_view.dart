import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/gradient_button.dart';
import '../../components/app_text_field.dart';
import '../../viewmodels/auth/reset_password_viewmodel.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResetPasswordViewModel(),
      child: const _ResetBody(),
    );
  }
}

class _ResetBody extends StatelessWidget {
  const _ResetBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ResetPasswordViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: const Color(0xFF0B101B),
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Form(
            key: vm.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),
                Center(
                  child: Text(
                    'Enter your email address below to receive\n'
                    'a password reset link',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 10.sp,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 3.5.h),

                // Email field (rounded like mock)
                AppTextField(
                  controller: vm.emailCtrl,
                  label: 'Email',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email_outlined),
                  validator: vm.emailValidator,
                ),
                SizedBox(height: 2.6.h),

                // Gradient CTA
                GradientButton(
                  label: 'Send reset link',
                  loading: vm.loading,
                  onPressed: () => vm.sendLink(context),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
