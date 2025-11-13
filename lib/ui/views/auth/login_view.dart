import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
// import '../../../core/utils/image_paths.dart';
import '../../components/app_password_field.dart';
import '../../components/app_text_field.dart';
import '../../components/gradient_button.dart';
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
                  child: Center(child: const AppLogo(widthW: 125.7)),
                ),
                SizedBox(height: 3.h),

                // Title & subtitle
                Text(
                  'Login to Your Account',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0B101B),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.8.h),
                Text(
                  "Let's login to your account",
                  style: TextStyle(fontSize: 10.sp, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3.h),

                // Email / phone
                AppTextField(
                  controller: vm.emailCtrl,
                  label: 'Email/Phone Number',
                  hint: 'yourname@gmail.com',
                  keyboard: TextInputType.emailAddress,
                  prefix: const Icon(Icons.person_outline),
                  validator: vm.emailValidator,
                ),
                SizedBox(height: 1.6.h),

                // Password
                AppPasswordField(
                  controller: vm.passCtrl,
                  label: 'Password',
                  hint: '********',
                  validator: vm.passValidator,
                ),

                // Reset password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black54,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.resetPassword);
                    }, // TODO
                    child: const Text('Reset Password'),
                  ),
                ),
                SizedBox(height: 0.6.h),

                // Log In
                GradientButton(
                  label: 'Log In',
                  loading: vm.loading,
                  onPressed: () => {
                    Navigator.pushNamed(context, AppRoutes.editProfile),
                  },
                ),
                SizedBox(height: 2.6.h),

                // Divider with text
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black12)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        'Or sign in with',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 9.8.sp,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.black12)),
                  ],
                ),
                SizedBox(height: 1.8.h),

                // Social buttons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButton(
                      onTap: () {}, // TODO Google
                      icon: Image.asset(
                        'assets/images/google.png',
                        height: 24,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.g_mobiledata),
                      ),
                    ),
                    SocialButton(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.dailyRoutine);
                      }, // TODO Apple
                      icon: const Icon(Icons.apple, size: 26),
                    ),
                    SocialButton(
                      onTap: () {}, // TODO email link
                      icon: const Icon(Icons.mail_outline, size: 24),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),

                // Bottom link
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black54, fontSize: 10.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: Text(
                        'Sign In', // (mock says Sign In; change to Sign Up if needed)
                        style: TextStyle(
                          color: const Color(0xFF2D6DD6),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
