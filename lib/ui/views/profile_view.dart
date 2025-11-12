import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:liv_e/ui/components/gradient_button.dart';
import 'package:liv_e/ui/viewmodels/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF), // light blue like mock
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0B101B),
          ),
        ),
      ),

      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.2.h), // top space under header

              // Avatar
              Container(
                width: 13.5.h,
                height: 13.5.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F1FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 56, color: Colors.black38),
              ),

              SizedBox(height: 3.6.h),

              // Name & email (centered)
              Text(
                vm.name,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0B101B),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: .6.h),
              Text(
                vm.email,
                style: TextStyle(fontSize: 10.sp, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 1.8.h),

              // Edit Profile button (compact, pill)
              SizedBox(
                width: 52.w,
                child: GradientButton(
                  label: 'Edit Profile',
                  // onPressed: () => vm.editProfile(context),
                  expand: false,
                  height: 5.2.h, onPressed: () { 
                    Navigator.pushNamed(context, AppRoutes.dailyRoutine);

                   },
                ),
              ),

              // “Setting” header
              SizedBox(height: 3.4.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: .4.w),
                  child: Text(
                    'Setting',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp, color: const Color(0xFF0B101B)),
                  ),
                ),
              ),
              SizedBox(height: 1.2.h),

              // Card
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 3.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(.06),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _rowSwitch(
                      context,
                      icon: Icons.location_on_outlined,
                      iconBg: const Color(0xFFE3F2FF),
                      title: 'Location',
                      value: vm.location,
                      onChanged: vm.toggleLocation,
                    ),
                    _thinDivider(),
                    _rowSwitch(
                      context,
                      icon: Icons.privacy_tip_outlined,
                      iconBg: const Color(0xFFEFF5FF),
                      title: 'Privacy',
                      value: vm.privacy,
                      onChanged: vm.togglePrivacy,
                    ),
                    _thinDivider(),
                    _rowSwitch(
                      context,
                      icon: Icons.notifications_none_rounded,
                      iconBg: const Color(0xFFF2F6FF),
                      title: 'Notifications',
                      value: vm.notifications,
                      onChanged: vm.toggleNotifications,
                    ),

                    // Logout row (no trailing chevron per mock)
                    _thinDivider(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.notifications);

                      },
                      child: Container(
                        height: 7.h,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            _iconBadge(
                              Icons.logout_rounded,
                              const Color(0xFFFFEBEE),
                              const Color(0xFFE53935),
                            ),
                            SizedBox(width: 3.6.w),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: const Color(0xFFE53935),
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- private UI helpers ----

  Widget _rowSwitch(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SizedBox(
      height: 7.h, // fixed row height for consistent spacing like mock
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          children: [
            _iconBadge(icon, iconBg, const Color(0xFF2D6DD6)),
            SizedBox(width: 3.6.w),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF2D6DD6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconBadge(IconData icon, Color bg, Color fg) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, color: fg, size: 20),
    );
  }

  Widget _thinDivider() => const Divider(height: 1, thickness: .8, color: Color(0xFFF1F2F4));
}
