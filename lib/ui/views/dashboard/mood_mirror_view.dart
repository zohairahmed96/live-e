import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/viewmodels/dashboard/mood_mirror_viewmodel.dart';
import 'package:provider/provider.dart';

class MoodMirrorView extends StatelessWidget {
  const MoodMirrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MoodMirrorViewModel(),
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
          txt: 'Mood Mirror',
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ch(46)),
              Center(
                child: AppText(
                  txt: "How are you feeling right now?",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: ch(24)),
              Padding(
                padding: EdgeInsets.only(left: cw(30)),
                child: Row(
                  children: [
                    icon_widget(ImagePaths.happiness, "Emoji"),
                    SizedBox(width: cw(13)),
                    icon_widget(ImagePaths.mic, "Voice Tone"),
                    SizedBox(width: cw(13)),
                    icon_widget(ImagePaths.chat, "Chatting"),
                  ],
                ),
              ),
              SizedBox(height: ch(46)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(29)),
                child: GradientButton(
                  width: cw(372),
                  label: "Reflect Mood",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget icon_widget(img, txt) {
    return Column(
      children: [
        Container(
          width: cw(115),
          height: ch(86),
          decoration: BoxDecoration(
            color: AppColor.cE4F6FF,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            img,
            width: cw(58),
            height: ch(58),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: ch(11)),
        AppText(
          txt: txt,
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
