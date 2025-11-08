import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import 'package:liv_e/ui/viewmodels/dashboard/transport_assistance_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../components/action_blue_card.dart';

class TransportAssistanceView extends StatelessWidget {
  const TransportAssistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransportAssistanceViewModel(),
      child: const _TransportBody(),
    );
  }
}

class _TransportBody extends StatelessWidget {
  const _TransportBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TransportAssistanceViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE8F3FF), // light-blue band like mock
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF3CA4DC),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Transportation Assistance',
          style: TextStyle(
            color: const Color(0xFF0B101B),
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // first card
              ActionBlueCard(
                icon: ImagePaths.carIcon,
                title: 'Call a Ride',
                subtitle:
                    'Lorem ipsum is simply dummy text of the printing & typesetting…',
                onTap: () => vm.callARide(context),
              ),
              SizedBox(height: 1.6.h),

              // second card
              ActionBlueCard(
                icon: ImagePaths.busIcon,
                title: 'Public Transport',
                subtitle:
                    'Lorem ipsum is simply dummy text of the printing & typesetting…',
                onTap: () => vm.publicTransport(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
