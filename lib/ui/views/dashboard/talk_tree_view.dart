import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/font_size_slider.dart';
import 'package:liv_e/ui/components/slider.dart';
import 'package:liv_e/ui/components/text_field_common.dart';
import 'package:liv_e/ui/viewmodels/dashboard/talk_tree_viewmodel.dart';
import 'package:liv_e/ui/views/dashboard/bill_reminders_view.dart';
import 'package:provider/provider.dart';

class TalkTreeView extends StatelessWidget {
  const TalkTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TalkTreeViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TalkTreeViewModel>();

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
          txt: 'Talk Tree',
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
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                width: double.infinity,
                height: ch(239),
                color: AppColor.c3CA4DC,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ch(24)),
                    AppText(
                      txt: "How are you feeling today?",
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.f20,
                      color: AppColor.white,
                    ),
                    SizedBox(height: ch(18)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          ImagePaths.smile,
                          width: cw(59),
                          height: ch(59),
                        ),
                        Image.asset(
                          ImagePaths.normal,
                          width: cw(59),
                          height: ch(59),
                        ),
                        Image.asset(
                          ImagePaths.sad,
                          width: cw(59),
                          height: ch(59),
                        ),
                      ],
                    ),
                    SizedBox(height: ch(21)),
                    TextFieldCommon(
                      controller: vm.journeyEntry,
                      hint: "Optional Journey",
                      label: "",
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColor.white,
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(ImagePaths.growingTree, height: ch(273)),
                      AppText(
                        txt: "You're growing beautifully!",
                        fontSize: AppFontSize.f20,
                      ),
                      SizedBox(height: ch(21)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: cw(29)),
                        child: GradientButton(
                          label: "Check-in",
                          onPressed: () {},
                          width: cw(372),
                          height: ch(54),
                        ),
                      ),
                      SizedBox(height: ch(21)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: ch(16)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: AppText(
                  txt: "Growth Progress",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.f20,
                ),
              ),
              SizedBox(height: ch(7)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(txt: "Grwoth", fontWeight: FontWeight.w500),
                        AppText(
                          txt: "Growth Goal",
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(height: ch(12)),
                    GlobalSlider(),
                    SizedBox(height: ch(17)),
                    Center(
                      child: AppText(
                        txt: "5 days of consistent check-ins! Keep it going",
                      ),
                    ),
                    SizedBox(height: ch(54)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
