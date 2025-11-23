import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:liv_e/ui/components/notification_tile.dart';
import 'package:liv_e/ui/viewmodels/profile/notifications_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// import '../../components/notification_tile.dart';
// import '../../viewmodels/notifications/notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationsViewModel(),
      child: const _NotificationsBody(),
    );
  }
}

class _NotificationsBody extends StatelessWidget {
  const _NotificationsBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<NotificationsViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF), // light blue header like mock
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.c3CA4DC,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Notification',
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
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ch(34)),

              // Recent list (three cards)
              ..._buildList(vm.recent),

              SizedBox(height: ch(30)),

              AppText(
                txt: 'Last 30 Days',
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.f18,
                color: AppColor.black,
              ),
              SizedBox(height: ch(16)),

              // Older list
              ..._buildList(vm.last30),

              // SizedBox(height: 3.0.h),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildList(List items) {
    return [
      for (int i = 0; i < items.length; i++) ...[
        NotificationTile(item: items[i]),
        if (i != items.length - 1) SizedBox(height: ch(12)),
      ],
    ];
  }
}
