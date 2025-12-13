import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/viewmodels/dashboard/reflect_mood_viewmodels.dart';
import 'package:provider/provider.dart';

class ReflectMoodView extends StatelessWidget {
  const ReflectMoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReflectMoodViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cE4F6FF,
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
          txt: 'Reflect Mood',
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
              Container(
                width: double.infinity,
                color: AppColor.white,
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        ImagePaths.sadness,
                        height: ch(224),
                        width: cw(224),
                      ),

                      AppText(
                        txt: "You seem a bit low today.",
                        fontSize: AppFontSize.f20,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        txt: "That's okay. Let's take a deep breath together.",
                        height: 1.9,
                      ),
                      SizedBox(height: ch(37)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: cw(30)),
                        child: Row(
                          children: [
                            GradientButton(
                              width: cw(179),
                              height: ch(48),
                              label: "Breathing Exercise",
                              fontSize: AppFontSize.f14,
                              onPressed: () {},
                            ),
                            SizedBox(width: cw(12)),
                            GradientButton(
                              width: cw(179),
                              height: ch(48),
                              label: "Play Calming Video",
                              fontSize: AppFontSize.f14,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ch(15)),
                      GradientButton(
                        width: cw(179),
                        height: ch(48),
                        label: "Emergency Help",
                        fontSize: AppFontSize.f14,
                        onPressed: () {},
                      ),
                      SizedBox(height: ch(40)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(left: cw(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ch(27)),
                    AppText(
                      txt: "Would you like to try something to feel better?",
                      fontSize: AppFontSize.f20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: ch(36)),
                    Row(
                      children: [
                        icon_widget(ImagePaths.meditaiton, "Meditation\n"),
                        SizedBox(width: cw(13)),
                        icon_widget(ImagePaths.uplifiting, "Uplifting\nQuote"),
                        SizedBox(width: cw(13)),
                        icon_widget(
                          ImagePaths.meditaiton,
                          "Journaling\nPrompt",
                        ),
                        SizedBox(width: cw(13)),
                        icon_widget(
                          ImagePaths.meditaiton,
                          "Contact\nCaregiver",
                        ),
                      ],
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

  Widget icon_widget(img, txt) {
    return Column(
      children: [
        Container(
          width: cw(83),
          height: ch(68),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            img,
            width: cw(44),
            height: ch(48),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: ch(11)),
        AppText(
          txt: txt,
          fontSize: AppFontSize.f12,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
