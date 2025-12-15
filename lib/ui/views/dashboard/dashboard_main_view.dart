import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/chore_tile.dart';
import 'package:liv_e/ui/components/reminder_card.dart';
import 'package:liv_e/ui/viewmodels/dashboard/daily_routine_viewmodel.dart';
import 'package:liv_e/ui/viewmodels/dashboard/main-dashboard_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
// import '../../components/gradient_button.dart';
// import '../../components/reminder_card.dart';
// import '../../components/chore_tile.dart';
// import '../../viewmodels/routine/daily_routine_viewmodel.dart';

class DashboardMainView extends StatelessWidget {
  const DashboardMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardMainViewModel(),
      child: const _DashboardMainBody(),
    );
  }
}

class _DashboardMainBody extends StatelessWidget {
  const _DashboardMainBody();

  @override
  Widget build(BuildContext context) {
    // final vm = context.watch<DashboardMainViewModel>();
    final List<Map<String, dynamic>> features = [
      {
        'title': 'Daily Routine &\nReminders',
        'image': ImagePaths.daily_routine,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.settings);
        },
      },
      {
        'title': 'Health &\nWellness',
        'image': ImagePaths.health,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.settings);
        },
      },
      {
        'title': 'Community &\nEvents',
        'image': ImagePaths.community,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.communityEvents);
        },
      },
      {
        'title': 'Transportation\nAssistance',
        'image': ImagePaths.transportation,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.transport);
        },
      },
      {
        'title': 'Financial',
        'image': ImagePaths.financial,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.financial);
        },
      },
      {
        'title': 'Safety',
        'image': ImagePaths.safety,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.settings);
        },
      },
      {
        'title': 'Communications',
        'image': ImagePaths.communications,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.settings);
        },
      },
      {
        'title': 'Daily Brief',
        'image': ImagePaths.daily_brief,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.settings);
        },
      },
      {
        'title': 'Emotional',
        'image': ImagePaths.emotional,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.settings);
        },
      },
      {
        'title': 'Talk Tree',
        'image': ImagePaths.talk_tree,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.talkTree);
        },
      },
      {
        'title': 'Mood Mirror',
        'image': ImagePaths.mood_mirror,
        'nav': (BuildContext context) {
          Navigator.pushNamed(context, AppRoutes.moodMirror);
        },
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: ch(96),
          padding: EdgeInsets.symmetric(horizontal: cw(40)),
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12, // softness
                spreadRadius: 0,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settings);
                },
                child: Image.asset(
                  ImagePaths.setting,
                  width: cw(34),
                  height: ch(34),
                ),
              ),
              GradientButton(
                width: cw(174),
                height: ch(51),
                label: "SOS",
                onPressed: () {},
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.liveAssisstant);
                },
                child: Image.asset(
                  ImagePaths.mic,
                  width: cw(22),
                  height: ch(34),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ch(45)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.notifications);
                      },
                      child: Container(
                        height: ch(45),
                        width: cw(45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: AppColor.cCDEDFF,
                        ),
                        child: Image.asset(
                          ImagePaths.notification,
                          width: cw(22),
                          height: ch(22),
                        ),
                      ),
                    ),
                    Image.asset(
                      ImagePaths.live,
                      width: cw(132),
                      height: ch(54),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.profile);
                      },
                      child: Container(
                        height: ch(45),
                        width: cw(45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: AppColor.cCDEDFF,
                        ),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: cw(20),
                          height: ch(24),
                          child: Image.asset(
                            ImagePaths.buddy,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ch(26)),
              Container(
                color: AppColor.cE4F6FF,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: ch(30)),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: cw(370),
                        height: ch(176),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          ImagePaths.mask,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      left: cw(100),
                      top: ch(76),
                      child: AppText(
                        txt: "Good Morning Jill",
                        fontSize: AppFontSize.f28,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ch(22)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: (features.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    final int first = index * 2;
                    final int second = first + 1;

                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _card(
                          features[first]['image']!,
                          features[first]['title']!,
                          () => features[first]['nav'](context),
                        ),
                        SizedBox(width: cw(20)),
                        second < features.length
                            ? _card(
                                features[second]['image']!,
                                features[second]['title']!,
                                () => features[second]['nav'](context),
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(String image, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: ch(128),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          SizedBox(height: ch(12)),
          AppText(
            txt: title,
            fontSize: AppFontSize.f16,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ch(25)),
        ],
      ),
    );
  }
}
