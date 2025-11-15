import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liv_e/ui/components/calender.dart';
import 'package:liv_e/ui/viewmodels/dashboard/community_events_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// 👇 calendar component you already used in Bill Reminders screen.
// change import/name to whatever you actually called it.

class CommunityEventsView extends StatelessWidget {
  const CommunityEventsView({super.key});

  // 375 width → .w
  double wp(double px) => (px / 375.0) * 100.w;
  // 812 height → .h
  double hp(double px) => (px / 812.0) * 100.h;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommunityEventsViewModel(),
      child: _CommunityEventsBody(wp: wp, hp: hp),
    );
  }
}

class _CommunityEventsBody extends StatelessWidget {
  const _CommunityEventsBody({required this.wp, required this.hp});

  final double Function(double) wp;
  final double Function(double) hp;

  static const Color kHeaderBG = Color(0xFFE8F3FF);
  static const Color kScreenBG = Color(0xFFE4F6FF); // overall bg
  static const Color kBlue = Color(0xFF3CA4DC);
  static const Color kCardWhite = Colors.white;
  static const Color kBorder = Color(0xFFE4E4E4);

  TextStyle get _sectionTitle => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityEventsViewModel>();

    return Scaffold(
      backgroundColor: kScreenBG,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kHeaderBG,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kBlue),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Community & Events',
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
          // ❗ sirf vertical padding – strips full-width rahen
          padding: EdgeInsets.symmetric(vertical: hp(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================== COMMUNITY RESOURCES (white strip) ==================
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  // horizontal: wp(30),
                  vertical: hp(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: wp(30)),
                      child: Text(vm.communityTitle, style: _sectionTitle),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: wp(30)),
                      child: Text(
                        vm.communitySub,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(10)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // left white card
                        Container(
                          width: wp(255), // 277 / 375 * 100 .w
                          height: hp(83), // 83 / 812 * 100 .h
                          decoration: BoxDecoration(
                            color: kCardWhite,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: kBorder, width: 1),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: wp(12),
                            vertical: hp(10),
                          ),
                          child: Row(
                            children: [
                              // location icon 26×37
                              SizedBox(
                                width: wp(26),
                                height: hp(37),
                                child: Image.asset(
                                  'assets/images/ic_location.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: wp(10)),
                              SizedBox(
                                width: wp(
                                  160,
                                ), // 👈 width adjust here (150–180 perfect)
                                child: Text(
                                  vm.communityDesc,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis, // optional
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: wp(8)), // chhota gap
                        // right Google Maps icon 83×83
                        SizedBox(
                          width: wp(83),
                          height: hp(83),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              'assets/images/ic_google_map.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ================== BUDDY SYSTEM (light-blue strip) ==================
              SizedBox(height: hp(8)),
              Container(
                color: kScreenBG, // screenshot mein yahan halka blue band hai
                padding: EdgeInsets.symmetric(
                  horizontal: wp(30),
                  vertical: hp(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Buddy System', style: _sectionTitle),
                    SizedBox(height: hp(10)),

                    Container(
                      width: double.infinity,
                      height: hp(83),
                      decoration: BoxDecoration(
                        color: kCardWhite,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kBorder, width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: wp(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // left avatar box 63×69
                          Container(
                            width: wp(63),
                            height: hp(69),
                            decoration: BoxDecoration(
                              color: kScreenBG,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: wp(33),
                                height: hp(33),
                                child: Image.asset(
                                  'assets/images/ic_buddy.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: wp(14)),

                          // Jill Powell + email
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vm.buddyName,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(height: hp(4)),
                                Text(
                                  vm.buddyEmail,
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF626262),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // phone button 57×57 + icon 29×29
                          Container(
                            width: wp(57),
                            height: hp(57),
                            decoration: BoxDecoration(
                              color: kBlue,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: wp(29),
                                height: hp(29),
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

              // ================== EVENTS FEED (white strip) ==================
              SizedBox(height: hp(8)),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: wp(30),
                  vertical: hp(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Events Feed', style: _sectionTitle),
                    SizedBox(height: hp(10)),
                    SizedBox(
                      width: double.infinity,
                      child: BlueCalendar(
                        month: vm.current,
                        isReminder: vm.isReminder,
                        onDayTap: vm.toggleReminder,
                        onPrev: vm.prevMonth,
                        onNext: vm.nextMonth,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: hp(12)),
            ],
          ),
        ),
      ),
    );
  }
}
