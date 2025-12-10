import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
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
              AppText(
                txt: "Budget Amount",
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.w500,
              ),
              TextFieldCommon(
                controller: vm.newBudget,
                label: '',
                hint: 'Bill Name',
                // validator: (v) => vm.notEmpty(v, 'title'),
                fillColor: kFill, // ✅ filled light
                borderRadius: BorderRadius.circular(8),
              ),

              AppText(
                txt: "Time Period",
                fontWeight: FontWeight.w600,
                // fontSize: 12.sp,
              ),
              Container(
                width: cw(370),
                height: ch(62),
                // padding: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4F6FF), // 🌟 background color fixed
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
              SizedBox(height: ch(25)),
              _categoryRow("Groceries", vm.groceryController),
              SizedBox(height: ch(12)),
              _categoryRow("Utilities", vm.groceryController),
              SizedBox(height: ch(12)),
              _categoryRow("Savings", vm.groceryController),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _categoryRow(String label, TextEditingController ctrl) {
  return Row(
    children: [
      Expanded(
        child: AppText(txt: label, fontWeight: FontWeight.w500),
      ),
      Column(
        children: [
          SizedBox(
            width: cw(166),
            child: TextFieldCommon(
              controller: ctrl,
              hint: "Amount",
              label: "Amount",
              fillColor: const Color(0xFFE4F6FF),
              keyboardType: TextInputType.number,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
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
                      width: b.maxWidth * (10 / 100), // ← FIX
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
    ],
  );
}

// -------------------- Remaining Budget Rows --------------------
Widget _remainingRow(String left, String right) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(txt: left, color: Colors.white, fontWeight: FontWeight.w600),
      AppText(txt: right, color: Colors.white, fontWeight: FontWeight.w600),
    ],
  );
}
