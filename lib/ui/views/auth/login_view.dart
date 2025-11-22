import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/app_text_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
// import '../../../core/utils/image_paths.dart';
import '../../components/app_password_field.dart';
import '../../components/app_text_field.dart';
import '../../components/Button/gradient_button.dart';
import '../../components/social_button.dart';
import '../../components/app_logo.dart';
import '../../viewmodels/auth/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

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
                SizedBox(height: 2.h),

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

                // Title & subtitle
                AppText(
                  txt: 'Login to Your Account',
                  fontSize: AppFontSize.f26,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: ch(14.29)),
                AppText(
                  txt: "Let's login to your account",
                  fontSize: AppFontSize.f16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ch(42.14)),

                // Email / phone
                AppTextField(
                  controller: vm.emailCtrl,
                  label: 'Email/Phone Number',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: Image.asset(ImagePaths.email),
                  validator: vm.emailValidator,
                ),
                SizedBox(height: 1.6.h),

                // Password
                AppTextField(
                  controller: vm.passCtrl,
                  hint: "********",
                  label: "Password",
                  prefix: Image.asset(ImagePaths.lock),
                  isPassword: true, // show/hide eye enabled
                  validator: vm.passValidator,
                ),
                SizedBox(height: ch(ch(10.54))),
                // Reset password
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.resetPassword);
                    },
                    text: 'Reset Password',
                    fontSize: AppFontSize.f14,
                    textColor: AppColor.c5E5E5E,
                    underline: true,
                  ),
                ),
                SizedBox(height: ch(23)),

                // Log In
                GradientButton(
                  label: 'Log In',
                  loading: vm.loading,
                  onPressed: () => {
                    Navigator.pushNamed(context, AppRoutes.settings),
                  },
                ),
                SizedBox(height: 2.6.h),

                // Divider with text
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black12)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: AppText(
                        txt: 'Or sign in with',
                        fontSize: AppFontSize.f16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.c454545,
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.black12)),
                  ],
                ),
                SizedBox(height: ch(24.2)),

                // Social buttons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButton(
                      onTap: () {}, // TODO Google
                      icon: Image.asset(
                        ImagePaths.google,
                        height: ch(24),
                        width: cw(25),
                      ),
                    ),
                    SocialButton(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.dailyRoutine);
                      }, // TODO Apple
                      icon: Image.asset(
                        ImagePaths.apple,
                        height: ch(24),
                        width: cw(25),
                      ),
                    ),
                    SocialButton(
                      onTap: () {}, // TODO email link
                      icon: Image.asset(
                        ImagePaths.mail,
                        height: ch(24),
                        width: cw(25),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: (69.34)),

                // Bottom link
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    AppText(
                      txt: "Don't have an account? ",
                      color: AppColor.c454545,
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontSize.f16,
                    ),
                    // Text(

                    //   style: TextStyle(color: Colors.black54, fontSize: 10.sp),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: AppText(
                        txt: 'Sign In',
                        color: AppColor.c3CA4DC,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.f16,
                      ),
                      // Text(
                      //   'Sign In', // (mock says Sign In; change to Sign Up if needed)
                      //   style: TextStyle(
                      //     color: const Color(0xFF2D6DD6),
                      //     fontSize: 10.sp,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ),
                  ],
                ),

                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
