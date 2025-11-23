import 'dart:io';
import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/viewmodels/profile/edit_profile_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// import '../../components/gradient_button.dart';
// import '../../viewmodels/profile/edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditProfileViewModel(),
      child: const _EditBody(),
    );
  }
}

class _EditBody extends StatelessWidget {
  const _EditBody();

  InputDecoration _blueFill(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
      ),
      filled: true,
      fillColor: const Color(0xFFEAF6FF), // light blue fill like mock
      hintStyle: const TextStyle(color: Colors.black45),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xFF55B4FF), width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EditProfileViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8F3FF), // header light blue
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0B101B),
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
              children: [
                SizedBox(height: 3.h),

                // Avatar with camera badge
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 14.h,
                      height: 14.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAF6FF),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: vm.photoPath == null
                          ? Image.asset(
                              ImagePaths.peopleIconBlue,
                              width: cw(101),
                              height: ch(101),
                            )
                          : Image.file(File(vm.photoPath!), fit: BoxFit.cover),
                    ),
                    GestureDetector(
                      // onTap: vm.pickImage,
                      child: Container(
                        width: cw(48),
                        height: cw(48),
                        decoration: const BoxDecoration(
                          color: AppColor.c3CA4DC,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 23,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 1.6.h),

                // Name + email preview (bold + grey)
                Text(
                  'Jill Powell',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0B101B),
                  ),
                ),
                SizedBox(height: .6.h),
                Text(
                  'ex@example.com',
                  style: TextStyle(color: Colors.black45, fontSize: 10.sp),
                ),

                SizedBox(height: 2.2.h),

                // Fields (light blue filled, rounded)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Full Name',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                SizedBox(height: .6.h),
                TextFormField(
                  controller: vm.nameCtrl,
                  validator: (v) => vm.notEmpty(v, 'full name'),
                  decoration: _blueFill(''),
                ),
                SizedBox(height: 1.6.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                SizedBox(height: .6.h),
                TextFormField(
                  controller: vm.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: vm.emailValidator,
                  decoration: _blueFill(''),
                ),
                SizedBox(height: 1.6.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Age',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                SizedBox(height: .6.h),
                TextFormField(
                  controller: vm.ageCtrl,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Enter age';
                    final a = int.tryParse(v.trim());
                    if (a == null || a < 1 || a > 130) return 'Enter valid age';
                    return null;
                  },
                  decoration: _blueFill(''),
                ),
                SizedBox(height: 1.6.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Disability',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                SizedBox(height: .6.h),
                TextFormField(
                  controller: vm.disabilityCtrl,
                  decoration: _blueFill(''),
                ),

                SizedBox(height: 3.0.h),

                // Save button (full width gradient)
                GradientButton(
                  label: 'Save',
                  loading: vm.saving,
                  onPressed: () => {
                    Navigator.pushNamed(context, AppRoutes.spendingOverview),
                  },
                  // vm.save(context),
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
