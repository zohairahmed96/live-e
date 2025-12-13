import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/Button/app_outlined_button.dart';
import 'package:liv_e/ui/components/Button/app_primary_button.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/viewmodels/dashboard/detailed_spending_overview_viewmodel.dart';
import '../../../core/utils/image_paths.dart';
import 'package:liv_e/ui/viewmodels/dashboard/financial_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DetailedSpendingOverViewView extends StatelessWidget {
  const DetailedSpendingOverViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailedSpendingOverviewViewmodel(),
      child: const _DetailedSpendingOverViewBody(),
    );
  }
}

class _DetailedSpendingOverViewBody extends StatelessWidget {
  const _DetailedSpendingOverViewBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DetailedSpendingOverviewViewmodel>();

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
          txt: 'Detailed Spending Breakdown',
          fontSize: AppFontSize.f18,
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
              _customCard(text: "Food", amount: "\$320", budgetProgress: 40),
              _customCard(
                text: "Entertainment",
                amount: "\$160",
                budgetProgress: 20,
              ),
              _customCard(
                text: "Transportation",
                amount: "\$100",
                budgetProgress: 20,
              ),
              _customCard(text: "Others", amount: "\$120", budgetProgress: 12),
              // ---- Due Bill Alerts header ----
              SizedBox(height: ch(18)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: cw(30),
                  right: cw(30),
                  top: ch(21),
                  bottom: ch(14),
                ),
                // height: ch(138),
                decoration: BoxDecoration(color: AppColor.c3CA4DC),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _rowText(title: "Total Spent", amount: "\$700"),
                    SizedBox(height: ch(12)),
                    Divider(color: AppColor.white),
                    SizedBox(height: ch(12)),
                    _rowText(title: "Total Budget", amount: "\$800"),
                    SizedBox(height: ch(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          onPressed: () {},
                          height: ch(31),
                          width: cw(181),
                          text: "This Month",
                          borderRadius: 4,
                          buttonColor: AppColor.cE4F6FF,
                          color: AppColor.c3CA4DC,
                          fontSize: AppFontSize.f12,
                        ),
                        AppButton(
                          onPressed: () {},
                          height: ch(31),
                          width: cw(181),
                          text: "Last Week",
                          borderRadius: 4,
                          buttonColor: AppColor.cE4F6FF,
                          color: AppColor.c3CA4DC,
                          fontSize: AppFontSize.f12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: ch(31)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppOutlinedButton(
                    onPressed: () => {},
                    text: "Set New Budget",
                    borderColor: AppColor.c3CA4DC,
                    fontSize: AppFontSize.f16,
                    width: cw(180),
                  ),
                  SizedBox(width: cw(10)),
                  // AppButton(onPressed: () {}, text: "", width: cw(141)),
                  GradientButton(
                    label: 'Back to Overview',
                    onPressed: () {},
                    height: ch(54),
                    width: cw(180),
                    fontSize: AppFontSize.f16,
                    gradient: const LinearGradient(
                      colors: [AppColor.c3CA4DC, AppColor.c334EA0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _rowText({String? title, String? amount}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(
        txt: title ?? "",
        fontSize: AppFontSize.f16,
        fontWeight: FontWeight.w500,
        color: AppColor.white,
      ),
      AppText(
        txt: amount ?? "",
        fontSize: AppFontSize.f16,
        fontWeight: FontWeight.w500,
        color: AppColor.white,
      ),
    ],
  );
}

Widget _customCard({String? text, String? amount, int? budgetProgress}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(30)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ch(12)),
        Container(
          padding: EdgeInsets.only(
            left: cw(12),
            right: cw(12),
            top: cw(10),
            bottom: ch(17),
            // vertical: ch(27),
          ),
          width: cw(370),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.cE4E4E4),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    txt: text ?? "",
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                  ),
                  // Text('Goal', style: TextStyle(color: Colors.black54)),
                  AppText(
                    txt: amount ?? "",
                    fontSize: AppFontSize.f16,
                    fontWeight: FontWeight.w500,
                  ),
                  // Text('Spent', style: TextStyle(color: Colors.black54)),
                ],
              ),
              SizedBox(height: ch(14)),
              // progress bar
              Row(
                children: [
                  Expanded(
                    // ← FIX: progress bar will take remaining width
                    child: Container(
                      height: 1.4.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EEF8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: LayoutBuilder(
                        builder: (c, b) => Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width:
                                b.maxWidth *
                                ((budgetProgress ?? 0) / 100), // ← FIX
                            decoration: BoxDecoration(
                              color: AppColor.c3CA4DC,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // spacing
                  AppText(txt: "${budgetProgress ?? 0}%"),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
