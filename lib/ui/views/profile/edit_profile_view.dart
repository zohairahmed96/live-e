import 'dart:io';
import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
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
        toolbarHeight: ch(80),
        elevation: 0,
        backgroundColor: AppColor.cE4F6FF,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.c3CA4DC,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: AppText(
          txt: 'Edit Profile',
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w600,
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
                SizedBox(height: ch(20)),
                // Avatar with camera badge
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: ch(111),
                      height: ch(111),
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAF6FF),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: vm.photoPath == null
                          ? Image.asset(
                              ImagePaths.peopleIconBlue,
                              width: cw(47),
                              height: ch(57),
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

                SizedBox(height: ch(14)),

                // Name + email preview (bold + grey)
                AppText(
                  txt: ' Jill Powell',
                  fontSize: AppFontSize.f24,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: ch(6)),
                AppText(
                  txt: 'ex@example.com',
                  fontSize: AppFontSize.f18,
                  color: AppColor.black.withOpacity(0.6),
                ),

                SizedBox(height: ch(17)),

                // Fields (light blue filled, rounded)
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    txt: 'Full Name',
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: ch(8)),
                TextFormField(
                  controller: vm.nameCtrl,
                  validator: (v) => vm.notEmpty(v, 'full name'),
                  decoration: _blueFill(''),
                ),
                SizedBox(height: ch(14)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    txt: 'Email Address',
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: ch(8)),
                TextFormField(
                  controller: vm.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: vm.emailValidator,
                  decoration: _blueFill(''),
                ),
                SizedBox(height: ch(8)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    txt: 'Age',
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: ch(8)),
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
                SizedBox(height: ch(14)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    txt: 'Disability',
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: .6.h),
                TextFormField(
                  controller: vm.disabilityCtrl,
                  decoration: _blueFill(''),
                ),

                SizedBox(height: ch(57)),

                // Save button (full width gradient)
                GradientButton(
                  width: cw(372),
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
