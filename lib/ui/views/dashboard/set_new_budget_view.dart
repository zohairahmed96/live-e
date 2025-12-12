import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/Button/app_outlined_button.dart';
import 'package:liv_e/ui/components/Button/gradient_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/app_text_field.dart';
import 'package:liv_e/ui/components/text_field_common.dart';
import 'package:liv_e/ui/viewmodels/dashboard/set_new_budget_viewmodel.dart';
import 'package:provider/provider.dart';

class SetNewBudgetView extends StatelessWidget {
  const SetNewBudgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SetNewBudgetViewmodel(),
      child: const _SetNewBudgetViewModelBody(),
    );
  }
}

class _SetNewBudgetViewModelBody extends StatelessWidget {
  const _SetNewBudgetViewModelBody();
  static const kFill = AppColor.cE4F6FF;
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SetNewBudgetViewmodel>();

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
          txt: 'Set New Budget',
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
              SizedBox(height: ch(25)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: AppText(
                  txt: "Budget Amount",
                  fontSize: AppFontSize.f16,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              SizedBox(height: ch(8)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: TextFieldCommon(
                  controller: vm.newBudget,
                  label: '',
                  hint: 'Enter New Budget',
                  // validator: (v) => vm.notEmpty(v, 'title'),
                  fillColor: kFill, // ✅ filled light
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: ch(18)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: AppText(
                  txt: "Time Period",
                  fontWeight: FontWeight.w600,
                  height: 1.3,

                  // fontSize: 12.sp,
                ),
              ),
              SizedBox(height: ch(8)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(30)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: cw(26)),
                  width: cw(370),
                  height: ch(62),
                  // padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppColor.cE4F6FF,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: vm.selectedPeriod,
                      dropdownColor: AppColor.cE4F6FF,
                      focusColor: Colors.transparent,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColor.c3CA4DC,
                      ),
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      onTap: () {},
                      enableFeedback: false,
                      items: vm.periods.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: vm.onPeriodChange,
                    ),
                  ),
                ),
              ),
              SizedBox(height: ch(25)),
              _categoryRow(
                label: "Groceries",
                ctrl: vm.groceryController,
                val: 50,
                isProgressBar: true,
              ),
              SizedBox(height: ch(12)),
              _categoryRow(
                label: "Utilities",
                ctrl: vm.groceryController,
                val: 40,
                isProgressBar: true,
              ),
              SizedBox(height: ch(12)),
              _categoryRow(
                label: "Savings",
                ctrl: vm.groceryController,
                val: 40,
                isProgressBar: true,
              ),
              SizedBox(height: ch(24.4)),
              Container(
                color: AppColor.c3CA4DC,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: ch(20)),
                    _categoryRow(label: "Remainings", amount: "500"),
                    SizedBox(height: ch(12)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: cw(30)),
                      child: Row(
                        children: [
                          Container(
                            height: ch(4.6),
                            width: cw(310),
                            decoration: BoxDecoration(
                              color: AppColor.cE4F6FF.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: LayoutBuilder(
                              builder: (c, b) => Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: b.maxWidth * (80 / 100), // ← FIX
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ch(18)),
                    Divider(color: AppColor.cE4F6FF.withOpacity(0.3)),
                    SizedBox(height: ch(16)),
                    _categoryRow(label: "Total Budget", amount: "800"),
                    SizedBox(height: ch(20)),
                  ],
                ),
              ),
              SizedBox(height: ch(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppOutlinedButton(
                    onPressed: () => {},
                    text: "Cancel",
                    borderColor: AppColor.c3CA4DC,
                    fontSize: AppFontSize.f16,
                    width: cw(161),
                    height: ch(54),
                  ),
                  SizedBox(width: cw(10)),
                  // AppButton(onPressed: () {}, text: "", width: cw(141)),
                  GradientButton(
                    label: 'Save Budget',
                    onPressed: () {},
                    height: ch(54),
                    width: cw(161),
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

Widget _categoryRow({
  required String label,
  TextEditingController? ctrl,
  String? amount,
  int? val,
  bool isProgressBar = false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: cw(30)),
    child: Row(
      children: [
        Expanded(
          child: AppText(
            txt: label,
            fontWeight: FontWeight.w500,
            color: isProgressBar ? AppColor.black : AppColor.white,
          ),
        ),
        if (isProgressBar) ...[
          SizedBox(
            width: cw(166),
            child: Column(
              children: [
                TextFieldCommon(
                  controller: ctrl!,
                  hint: "Amount",
                  label: "Amount",
                  fillColor: const Color(0xFFE4F6FF),
                  keyboardType: TextInputType.number,
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(height: ch(10)),
                Row(
                  children: [
                    Container(
                      height: ch(4.6),
                      width: cw(166),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EEF8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: LayoutBuilder(
                        builder: (c, b) => Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: b.maxWidth * (val! / 100), // ← FIX
                            decoration: BoxDecoration(
                              color: AppColor.c3CA4DC,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ] else ...[
          AppText(
            txt: "\$ ${amount!}",
            fontWeight: FontWeight.w500,
            color: isProgressBar ? AppColor.black : AppColor.white,
          ),
        ],
      ],
    ),
  );
}

// -------------------- Remaining Budget Rows --------------------
// Widget _remainingRow(String left, String right) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       AppText(txt: left, color: Colors.white, fontWeight: FontWeight.w600),
//       Column(
//         children: [
//           AppText(txt: right, color: Colors.white, fontWeight: FontWeight.w600),

//         ],
//       ),
//     ],
//   );
// }
