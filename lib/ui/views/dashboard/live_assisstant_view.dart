import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/app_primary_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/viewmodels/dashboard/live_assisstant_viewmodel.dart';
import 'package:provider/provider.dart';

class LifeAssisstantView extends StatelessWidget {
  const LifeAssisstantView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LiveAssisstantViewmodel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: ch(80),
        backgroundColor: const Color(0xFFE8F3FF),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.c3CA4DC,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: AppText(
          txt: 'LiV-E Assistant',
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w600,
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            /// CHAT CARD
            SizedBox(height: ch(31)),
            Container(
              height: ch(572),
              width: cw(371),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColor.cE4E4E4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _userBubble("Should I Take My Medicine Now?"),
                  SizedBox(height: ch(20)),
                  _botBubble("Yes, You Need To Take Your Medicine At 10:00 AM"),
                  SizedBox(height: ch(77)),
                  Row(
                    children: [
                      SizedBox(width: cw(11)),
                      _actionButton("Show My Routine", cw(171)),
                      SizedBox(width: cw(7)),
                      _actionButton("Set A Reminder", cw(171)),
                    ],
                  ),
                  SizedBox(height: ch(8)),
                  _actionButton("Send Message To Caregiver", cw(254)),
                  SizedBox(height: ch(39)),
                ],
              ),
            ),
            SizedBox(height: ch(38)),
            Center(
              child: Container(
                width: cw(105),
                height: ch(105),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColor.c3CA4DC, AppColor.c334EA0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  width: cw(29),
                  height: ch(45),
                  child: Image.asset(ImagePaths.mic_white, fit: BoxFit.contain),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// USER MESSAGE
  Widget _userBubble(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cw(11)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColor.c3CA4DC,
            child: Image.asset(ImagePaths.user, width: cw(20), height: ch(24)),
          ),
          SizedBox(width: cw(12)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.cE4F6FF,
                borderRadius: BorderRadius.circular(12),
              ),
              child: AppText(txt: text, fontSize: AppFontSize.f15),
            ),
          ),
        ],
      ),
    );
  }

  /// BOT MESSAGE
  Widget _botBubble(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cw(11)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.cB3E6FF,
                borderRadius: BorderRadius.circular(12),
              ),
              child: AppText(txt: text, fontSize: AppFontSize.f15, height: 1.3),
            ),
          ),
          SizedBox(width: cw(12)),
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColor.c3CA4DC,
            child: Image.asset(ImagePaths.bot, width: cw(20), height: ch(24)),
          ),
        ],
      ),
    );
  }

  /// ACTION BUTTON
  Widget _actionButton(String text, double w) {
    return AppButton(
      width: w,
      height: ch(41),
      buttonColor: AppColor.c3CA4DC,
      borderRadius: 8,
      onPressed: () {},
      text: text,
    );
  }
}
