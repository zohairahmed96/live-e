import 'package:flutter/material.dart';
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
            color: Colors.black87,
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
              SizedBox(height: 2.0.h),

              // Recent list (three cards)
              ..._buildList(vm.recent),

              SizedBox(height: 2.6.h),
              Text(
                'Last 30 Days',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                  color: const Color(0xFF0B101B),
                ),
              ),
              SizedBox(height: 1.2.h),

              // Older list
              ..._buildList(vm.last30),

              SizedBox(height: 3.0.h),
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
        if (i != items.length - 1) SizedBox(height: 1.2.h),
      ],
    ];
  }
}
