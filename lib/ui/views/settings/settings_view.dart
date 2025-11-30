import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/font_size_slider.dart';
import 'package:liv_e/ui/components/settings_row.dart';
import 'package:liv_e/ui/components/settings_section_card.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../viewmodels/settings/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  // map iPhone 375×812 px → Sizer %
  double wp(BuildContext c, double px) => (px / 375.0) * 100.w;
  double hp(BuildContext c, double px) => (px / 812.0) * 100.h;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsViewModel(),
      child: _SettingsBody(wp: wp, hp: hp),
    );
  }
}

class _SettingsBody extends StatelessWidget {
  const _SettingsBody({required this.wp, required this.hp});
  final double Function(BuildContext, double) wp;
  final double Function(BuildContext, double) hp;

  TextStyle sTitle() => GoogleFonts.poppins(
    fontSize: 20, // spec: 20
    fontWeight: FontWeight.w600, // spec: 600
    color: const Color(0xFF000000),
  );

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SettingsViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.cE8F3FF,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.c3CA4DC,
          ), // spec 1
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: AppText(
          txt: "Setting",
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w600,
        ),
        // Text(
        //   '',
        //   style: GoogleFonts.poppins(
        //     fontSize: 14.5.sp,
        //     fontWeight: FontWeight.w700,
        //     color: const Color(0xFF0B101B),
        //   ),
        // ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: cw(30), vertical: ch(27)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------- Accessibility --------
                AppText(
                  txt: "Accessibility",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w600,
                ),
                // Text('Accessibility', style: sTitle()),
                SizedBox(height: ch(18)),
                SettingsSectionCard(
                  height: ch(170),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: ch(15), bottom: ch(11)),
                        child: SettingsRow(
                          title: 'Font Size',
                          right: const FontSizeSlider(),
                        ),
                      ),
                      const Divider(
                        indent: 14,
                        endIndent: 14,
                        height: 1,
                        color: AppColor.cD7ECF9,
                      ),
                      SettingsRow(
                        title: 'Dark Mode',
                        right: Transform.scale(
                          scale: 0.8,
                          child: Switch.adaptive(
                            value: vm.darkMode,
                            onChanged: vm.toggleDark,
                            activeColor: AppColor.cE8F3FF,
                            inactiveTrackColor: AppColor.cC4EBFF,
                            thumbColor: MaterialStateProperty.all(
                              AppColor.c3CA4DC,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        indent: cw(14),
                        endIndent: cw(14),
                        height: 1,
                        color: AppColor.cD7ECF9,
                      ),
                      SettingsRow(
                        title: 'Text-to-Speech',
                        right: Transform.scale(
                          scale: 0.8,
                          child: Switch.adaptive(
                            value: vm.tts,
                            onChanged: vm.toggleTts,
                            activeColor: AppColor.c3CA4DC,
                            inactiveTrackColor: AppColor.cC4EBFF,
                            thumbColor: MaterialStateProperty.all(
                              AppColor.c3CA4DC,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ch(27)),

                // -------- Account Preferences --------
                Text('Account Preferences', style: sTitle()),
                SizedBox(height: ch(18)),
                SettingsSectionCard(
                  height: ch(120), // spec: 120px
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: ch(21), bottom: ch(17)),
                        child: SettingsRow(
                          title: 'Profile Information',
                          right: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColor.c3CA4DC,
                          ),
                        ),
                      ),
                      // SettingsNavRow(title: 'Profile Information'),
                      Divider(
                        indent: 14,
                        endIndent: 14,
                        height: 1,
                        color: AppColor.cD7ECF9,
                      ),
                      // SettingsNavRow(title: 'Caregiver Contact'),
                      Padding(
                        padding: EdgeInsets.only(top: ch(17)),
                        child: SettingsRow(
                          title: 'Caregiver Contact',
                          right: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColor.c3CA4DC,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ch(23)),

                // -------- App Info --------
                Text('App Info', style: sTitle()),
                SizedBox(height: ch(18)),
                SettingsSectionCard(
                  height: hp(context, 179), // spec: 179px
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: ch(21), bottom: ch(17)),
                        child: SettingsRow(
                          title: 'Version Info',
                          right: Text(
                            '14.0.0',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 14,
                        endIndent: 14,
                        height: 1,
                        color: AppColor.cD7ECF9,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: ch(17)),
                        child: SettingsRow(
                          title: 'Privacy Policy',
                          right: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.privacyPolicy,
                              );
                            },
                            child: Icon(
                              Icons.chevron_right_rounded,
                              color: AppColor.c3CA4DC,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 14,
                        endIndent: 14,
                        height: 1,
                        color: AppColor.cD7ECF9,
                      ),
                      // const SettingsNavRow(title: 'Feedback Form'),
                      Padding(
                        padding: EdgeInsets.only(top: ch(17)),
                        child: SettingsRow(
                          title: 'Feedback Form',
                          right: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   AppRoutes.privacyPolicy,
                              // );
                            },
                            child: Icon(
                              Icons.chevron_right_rounded,
                              color: AppColor.c3CA4DC,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: hp(context, 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
