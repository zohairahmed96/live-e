import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/calender.dart';
import 'package:liv_e/ui/viewmodels/dashboard/community_events_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// 👇 calendar component you already used in Bill Reminders screen.
// change import/name to whatever you actually called it.

class CommunityEventsView extends StatelessWidget {
  const CommunityEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommunityEventsViewModel(),
      child: _CommunityEventsBody(),
    );
  }
}

class _CommunityEventsBody extends StatelessWidget {
  const _CommunityEventsBody();

  static const Color kHeaderBG = Color(0xFFE8F3FF);
  static const Color kScreenBG = Color(0xFFE4F6FF); // overall bg
  static const Color kBlue = Color(0xFF3CA4DC);
  static const Color kCardWhite = Colors.white;
  static const Color kBorder = Color(0xFFE4E4E4);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityEventsViewModel>();

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: ch(80),
        backgroundColor: kHeaderBG,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kBlue),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: AppText(
          txt: 'Community & Events',
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(horizontal: cw(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================== COMMUNITY RESOURCES (white strip) ==================
              Padding(
                padding: EdgeInsets.only(left: cw(35), top: ch(24)),
                child: Container(
                  width: cw(233),
                  child: AppText(
                    txt: vm.communityTitle,
                    fontSize: AppFontSize.f20,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                    height: 1.3,
                  ),
                ),
              ),
              SizedBox(height: ch(14 - 1.3)),
              Padding(
                padding: EdgeInsets.only(
                  left: cw(30),
                  top: ch(14),
                  bottom: ch(26),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: cw(247),
                      height: ch(83),
                      decoration: BoxDecoration(
                        color: kCardWhite,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kBorder, width: 1),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: cw(10)),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.cE4F6FF,
                            ),
                            width: cw(69),
                            height: ch(63),
                            child: Image.asset(
                              'assets/images/ic_location.png',
                              // fit: BoxFit.contain,
                              width: cw(26),
                              height: ch(37),
                            ),
                          ),
                          SizedBox(width: cw(12)),
                          Container(
                            width: cw(150),
                            child: AppText(
                              txt: "Lorem Ipsum is simply dummy text",
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: cw(10)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        ImagePaths.googleMap,
                        // fit: BoxFit.cover,
                        width: cw(73),
                        height: ch(83),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: ch(163),
                width: double.infinity,
                color: AppColor.cE4F6FF,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: cw(30),
                    vertical: ch(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        txt: "Buddy System",
                        fontSize: AppFontSize.f20,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: ch(14)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: cw(10)),
                        width: cw(370),
                        height: ch(83),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.cE4F6FF,
                              ),
                              width: cw(69),
                              height: ch(63),
                              child: Image.asset(
                                ImagePaths.buddy,
                                // fit: BoxFit.contain,
                                width: cw(26),
                                height: ch(37),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  txt: vm.buddyName,
                                  fontSize: AppFontSize.f14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF000000),
                                ),
                                SizedBox(height: ch(4)),
                                AppText(
                                  txt: vm.buddyEmail,
                                  fontSize: AppFontSize.f11,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF000000),
                                ),
                              ],
                            ),
                            Container(
                              width: cw(57),
                              height: ch(57),
                              decoration: BoxDecoration(
                                color: kBlue,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: cw(29),
                                  height: ch(29),
                                  child: Image.asset(
                                    'assets/images/ic_phone_white.png',
                                    fit: BoxFit.contain,
                                  ),
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
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: cw(30),
                  vertical: ch(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      txt: 'Events Feed',
                      fontSize: AppFontSize.f20,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: ch(20)),
                    BlueCalendar(
                      month: vm.current,
                      isReminder: vm.isReminder,
                      onDayTap: vm.toggleReminder,
                      onPrev: vm.prevMonth,
                      onNext: vm.nextMonth,
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
}
