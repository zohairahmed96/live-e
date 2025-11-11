import 'package:flutter/material.dart';
import 'package:liv_e/ui/viewmodels/dashboard/set_reminder_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/gradient_button.dart';
import '../../components/text_field_common.dart';

class SetReminderView extends StatelessWidget {
  const SetReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SetReminderViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  static const kFill = Color(0xFFE4F6FF); // input bg
  static const kBlueStart = Color(0xFF3CA4DC); // button gradient start
  static const kBlueEnd = Color(0xFF334EA0); // button gradient end

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SetReminderViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Set Reminder',
          style: TextStyle(
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0B101B),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Form(
            key: vm.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _label('Title'),
                TextFieldCommon(
                  controller: vm.titleCtrl,
                  label: '',
                  hint: 'Bill Name',
                  validator: (v) => vm.notEmpty(v, 'title'),
                  fillColor: kFill, // ✅ filled light blue
                ),
                SizedBox(height: 1.6.h),

                _label('Date'),
                TextFieldCommon(
                  controller: vm.dateCtrl,
                  label: '',
                  hint: '11/06/2025',
                  readOnly: true,
                  onTap: () => vm.pickDate(context),
                  fillColor: kFill,
                ),
                SizedBox(height: 1.6.h),

                _label('Time'),
                TextFieldCommon(
                  controller: vm.timeCtrl,
                  label: '',
                  hint: '12.00 PM',
                  readOnly: true,
                  onTap: () => vm.pickTime(context),
                  fillColor: kFill,
                ),
                SizedBox(height: 1.6.h),

                _label('Repeat'),
                TextFieldCommon(
                  controller: vm.repeatCtrl,
                  label: '',
                  hint: 'Enter frequency',
                  fillColor: kFill,
                ),

                SizedBox(height: 3.0.h),

                GradientButton(
                  label: 'Continue',
                  onPressed: () => vm.submit(context),
                  loading: vm.saving,
                  gradient: const LinearGradient(
                    // ✅ exact gradient
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [kBlueStart, kBlueEnd],
                  ),
                ),
                SizedBox(height: 2.4.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String t) => Padding(
    padding: EdgeInsets.only(bottom: .6.h),
    child: Text(
      t,
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        fontSize: 10.sp,
      ),
    ),
  );
}
