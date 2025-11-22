import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/Button/gradient_button.dart';
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
                  child: AppText(
                    txt:
                        'Enter your email address below to receive\n'
                        'a password reset link',
                    color: AppColor.black,
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w200,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: ch(44)),

                // Email field (rounded like mock)
                AppTextField(
                  controller: vm.emailCtrl,
                  label: 'Email',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: Image.asset(
                    ImagePaths.resendEmail,
                    width: cw(17),
                    height: ch(17),
                  ),
                  validator: vm.emailValidator,
                ),
                SizedBox(height: ch(24.1)),

                // Gradient CTA
                GradientButton(
                  label: 'Send reset link',
                  loading: vm.loading,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.f20,
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
