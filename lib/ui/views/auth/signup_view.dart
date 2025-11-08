import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/routes/app_routes.dart';
// import '../../../core/utils/image_paths.dart';
import '../../components/app_logo.dart';
import '../../components/gradient_button.dart';
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
                SizedBox(height: 2.h),

                // Logo
                SizedBox(
                  height: 12.h,
                  child: const Center(child: AppLogo(widthW: 24)),
                ),
                SizedBox(height: 2.5.h),

                Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0B101B),
                  ),
                ),
                SizedBox(height: .7.h),
                Text(
                  "Let's Create your account here...",
                  style: TextStyle(fontSize: 10.sp, color: Colors.black45),
                ),
                SizedBox(height: 3.h),

                // Full name
                TextFormField(
                  controller: vm.nameCtrl,
                  validator: (v) => vm.notEmpty(v, 'full name'),
                  decoration: deco(
                    label: 'Full Name',
                    hint: 'yournamehere',
                    icon: Icons.person_outline,
                  ),
                ),
                SizedBox(height: 1.5.h),

                // Email
                TextFormField(
                  controller: vm.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: vm.emailValidator,
                  decoration: deco(
                    label: 'Email',
                    hint: 'yourname@gmail.com',
                    icon: Icons.email_outlined,
                  ),
                ),
                SizedBox(height: 1.5.h),

                // Phone
                TextFormField(
                  controller: vm.phoneCtrl,
                  keyboardType: TextInputType.phone,
                  validator: vm.phoneValidator,
                  decoration: deco(
                    label: 'Phone Number',
                    hint: '+91 223 456 7890',
                    icon: Icons.call_outlined,
                  ),
                ),
                SizedBox(height: 1.5.h),

                // Password
                TextFormField(
                  controller: vm.passCtrl,
                  obscureText: vm.obscure1,
                  validator: vm.passValidator,
                  decoration: deco(
                    label: 'Password',
                    hint: '********',
                    icon: Icons.lock_outline,
                    suffix: IconButton(
                      icon: Icon(
                        vm.obscure1
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        vm.obscure1 = !vm.obscure1;
                        // vm.notifyListeners();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h),

                // Confirm Password
                TextFormField(
                  controller: vm.cpassCtrl,
                  obscureText: vm.obscure2,
                  validator: vm.confirmValidator,
                  decoration: deco(
                    label: 'Confirm Password',
                    hint: '********',
                    icon: Icons.lock_outline,
                    suffix: IconButton(
                      icon: Icon(
                        vm.obscure2
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        vm.obscure2 = !vm.obscure2;
                        // vm.notifyListeners();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 2.4.h),

                GradientButton(
                  label: 'Continue',
                  loading: vm.loading,
                  onPressed: () => vm.submit(context),
                ),
                SizedBox(height: 2.2.h),

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
                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
