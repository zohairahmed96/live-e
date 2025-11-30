import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import '../../../core/utils/image_paths.dart';
import 'package:liv_e/ui/viewmodels/dashboard/financial_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FinancialManagementView extends StatelessWidget {
  const FinancialManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FinancialViewModel(),
      child: const _FinancialBody(),
    );
  }
}

class _FinancialBody extends StatelessWidget {
  const _FinancialBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<FinancialViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
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
          txt: 'Financial Management',
          fontSize: AppFontSize.f22,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ch(20)),
              // ---- Budget Section ----
              _customCard(
                cw(370),
                ch(72),
                'Budget',
                Column(
                  children: [
                    // progress bar
                    Container(
                      height: 1.4.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EEF8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: LayoutBuilder(
                        builder: (c, b) => Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: b.maxWidth * vm.budgetProgress,
                            decoration: BoxDecoration(
                              color: AppColor.c3CA4DC,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ch(7)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          txt: "Goal",
                          fontSize: AppFontSize.f13,
                          fontWeight: FontWeight.w500,
                        ),
                        // Text('Goal', style: TextStyle(color: Colors.black54)),
                        AppText(
                          txt: "Spent",
                          fontSize: AppFontSize.f13,
                          fontWeight: FontWeight.w500,
                        ),
                        // Text('Spent', style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
              // ---- Due Bill Alerts header ----
              SizedBox(height: ch(18)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: cw(31),
                  right: cw(31),
                  top: ch(14),
                  bottom: ch(21),
                ),
                decoration: BoxDecoration(color: AppColor.c3CA4DC),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      txt: 'Due Bill Alerts',
                      color: AppColor.white,
                      fontSize: AppFontSize.f20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: ch(12)),
                    Container(
                      width: cw(370),
                      height: ch(83),
                      // color: AppColor.white,
                      padding: EdgeInsets.only(left: cw(10), right: cw(10)),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // padding: EdgeInsets.only(left: cw(10)),
                            width: cw(77),
                            height: ch(63),
                            decoration: BoxDecoration(
                              color: AppColor.cE4F6FF,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              ImagePaths.reminder,
                              // width: cw(45),
                              // height: cw(45),
                              // fit: BoxFit.contain,
                            ),
                          ),
                          // SizedBox(width: cw(15)),
                          AppText(
                            txt: "Bill Reminders",
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontSize.f20,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: AppColor.c3CA4DC,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ---- Spending Overview ----
              SizedBox(height: ch(23)),
              _customCard(
                cw(370),
                ch(128),
                'Spending Overview',
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: cw(130),
                      height: ch(106),
                      decoration: BoxDecoration(
                        color: AppColor.cE4F6FF,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        ImagePaths.spending,
                        // width: cw(45),
                        // height: cw(45),
                        // fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: cw(13)),
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: ch(15)),
                          AppText(
                            txt: "Spending",
                            fontWeight: FontWeight.w500,
                            fontSize: AppFontSize.f20,
                            height: 1.8,
                          ),
                          AppText(
                            txt:
                                "Lorem Ipsum is simply dummy text of the printing & typesetting",
                            overFlow: TextOverflow.ellipsis,
                            fontSize: AppFontSize.f11,
                            maxLines: 3,
                            height: 1.4,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ch(20)),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: AppColor.c3CA4DC,
                        size: 34,
                      ),
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

Widget _customCard(double w, double h, String text, Widget? widget) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(30)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          txt: text,
          fontSize: AppFontSize.f20,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: ch(12)),
        Container(
          padding: EdgeInsets.only(
            left: cw(11),
            right: cw(11),
            // vertical: ch(27),
          ),
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.cE4E4E4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [?widget],
          ),
        ),
      ],
    ),
  );
}
