import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/app_text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/routes/app_routes.dart';
// import '../../../core/utils/image_paths.dart';
import '../../components/Button/gradient_button.dart';
import '../../viewmodels/auth/signup_viewmodel.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: const _SignupBody(),
    );
  }
}

class _SignupBody extends StatelessWidget {
  const _SignupBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SignupViewModel>();

    InputDecoration deco({
      required String label,
      required String hint,
      required IconData icon,
      Widget? suffix,
    }) {
      return InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(
            color: Colors.black12.withOpacity(.06),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Color(0xFF55B4FF), width: 1.2),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.5.h),
          child: Form(
            key: vm.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                SizedBox(
                  height: 12.h,
                  child: Center(
                    child: Image.asset(
                      ImagePaths.subLogo,
                      width: cw(125),
                      height: ch(125),
                    ),
                  ),
                ),
                SizedBox(height: ch(46.57)),

                AppText(
                  txt: 'Create Your Account',
                  fontSize: AppFontSize.f26,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black,
                ),

                SizedBox(height: ch(14.29)),

                AppText(
                  txt: "Let's Create your account here...",
                  fontSize: AppFontSize.f16,
                  fontWeight: FontWeight.w300,
                  color: AppColor.black,
                ),

                SizedBox(height: ch(42.14)),
                // Full name
                AppTextField(
                  controller: vm.nameCtrl,
                  label: 'Full Name',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.name,
                  prefix: Image.asset(ImagePaths.email),
                  validator: (v) => vm.notEmpty(v, 'full name'),
                ),

                SizedBox(height: ch(22.35)),

                // Email
                AppTextField(
                  controller: vm.emailCtrl,
                  label: 'Email',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: Image.asset(ImagePaths.resendEmail),
                  validator: (v) => vm.emailValidator(v),
                ),

                SizedBox(height: ch(23.21)),

                // Phone
                AppTextField(
                  controller: vm.phoneCtrl,
                  label: 'Phone Number',
                  hint: '+91 223 456 7890',
                  keyboard: TextInputType.phone,
                  prefix: Image.asset(ImagePaths.email),
                  validator: (v) => vm.phoneValidator(v),
                ),
                SizedBox(height: ch(22.35)),

                // Password
                AppTextField(
                  controller: vm.passCtrl,
                  label: 'Password',
                  hint: '********',
                  keyboard: TextInputType.visiblePassword,
                  prefix: Image.asset(ImagePaths.email),
                  validator: (v) => vm.passValidator(v),
                  isPassword: true,
                ),

                SizedBox(height: ch(22.54)),

                // Confirm Password
                AppTextField(
                  controller: vm.cpassCtrl,
                  label: 'Password',
                  hint: '********',
                  keyboard: TextInputType.visiblePassword,
                  prefix: Image.asset(ImagePaths.email),
                  validator: (v) => vm.confirmValidator(v),
                  isPassword: true,
                ),

                SizedBox(height: ch(27.6)),
                GradientButton(
                  label: 'Continue',
                  loading: vm.loading,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.f20,
                  onPressed: () => vm.submit(context),
                ),

                SizedBox(height: ch(22.6)),

                // bottom link
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.black54, fontSize: 10.sp),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.login,
                      ),
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          color: const Color(0xFF2D6DD6),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
