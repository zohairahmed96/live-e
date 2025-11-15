import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:liv_e/ui/components/font_size_slider.dart';
import 'package:liv_e/ui/components/settings_nav_row.dart';
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

  static const Color kHeaderBG = Color(0xFFE8F3FF);
  static const Color kBlue = Color(0xFF3CA4DC);
  static const Color kDivider = Color(0xFFD7ECF9);

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
        backgroundColor: kHeaderBG,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kBlue,
          ), // spec 1
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Setting',
          style: GoogleFonts.poppins(
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0B101B),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: wp(context, 20),
            vertical: hp(context, 16),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370), // spec: 370px
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------- Accessibility --------
                  Text('Accessibility', style: sTitle()),
                  SizedBox(height: hp(context, 10)),
                  SettingsSectionCard(
                    height: 23.h, // spec: 170px
                    child: Column(
                      children: [
                        SettingsRow(
                          title: 'Font Size',
                          right: const FontSizeSlider(),
                        ),
                        const Divider(height: 1, color: kDivider),
                        SettingsRow(
                          title: 'Dark Mode',
                          right: Transform.scale(
                            scale: 0.8,
                            child: Switch.adaptive(
                              value: vm.darkMode,
                              onChanged: vm.toggleDark,
                              activeColor: kBlue,
                            ),
                          ),
                        ),
                        const Divider(height: 1, color: kDivider),
                        SettingsRow(
                          title: 'Text-to-Speech',
                          right: Transform.scale(
                            scale: 0.8,
                            child: Switch.adaptive(
                              value: vm.tts,
                              onChanged: vm.toggleTts,
                              activeColor: const Color(0xFF3CA4DC),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: hp(context, 22)),

                  // -------- Account Preferences --------
                  Text('Account Preferences', style: sTitle()),
                  SizedBox(height: hp(context, 10)),
                  SettingsSectionCard(
                    height: hp(context, 120), // spec: 120px
                    child: Column(
                      children: const [
                        SettingsNavRow(title: 'Profile Information'),
                        Divider(height: 1, color: kDivider),
                        SettingsNavRow(title: 'Caregiver Contact'),
                      ],
                    ),
                  ),

                  SizedBox(height: hp(context, 22)),

                  // -------- App Info --------
                  Text('App Info', style: sTitle()),
                  SizedBox(height: hp(context, 10)),
                  SettingsSectionCard(
                    height: hp(context, 179), // spec: 179px
                    child: Column(
                      children: [
                        SettingsRow(
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
                        const Divider(height: 1, color: kDivider),
                        SettingsNavRow(
                          title: 'Privacy Policy',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.privacyPolicy,
                            );
                          },
                        ),
                        const Divider(height: 1, color: kDivider),
                        const SettingsNavRow(title: 'Feedback Form'),
                      ],
                    ),
                  ),

                  SizedBox(height: hp(context, 24)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
