import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../viewmodels/settings/privacy_policy_viewmodel.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  // 375-width → .w, 812-height → .h (tumhara rule)
  double wp(double px) => (px / 375.0) * 100.w;
  double hp(double px) => (px / 812.0) * 100.h;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PrivacyPolicyViewModel(),
      child: _PrivacyPolicyBody(wp: wp, hp: hp),
    );
  }
}

class _PrivacyPolicyBody extends StatelessWidget {
  const _PrivacyPolicyBody({required this.wp, required this.hp});

  final double Function(double) wp;
  final double Function(double) hp;

  static const Color kHeaderBG = Color(0xFFE8F3FF);
  static const Color kBlue = Color(0xFF3CA4DC);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PrivacyPolicyViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kHeaderBG,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kBlue),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: AppText(
          txt: 'Privacy Policy',
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w600,
        ),
        // Text(
        //   'Privacy Policy',
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
          padding: EdgeInsets.fromLTRB(
            cw(30), // left  = 30px -> .w
            ch(34), // top   = 34px -> .h
            cw(30), // right = 30px -> .w
            ch(16), // bottom thoda extra
          ),
          child: AppText(txt: vm.policyText, fontSize: AppFontSize.f14),
        ),
      ),
    );
  }
}
