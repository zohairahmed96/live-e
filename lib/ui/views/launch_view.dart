import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../components/gradient_background.dart';
import '../viewmodels/launch_vm.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  final vm = LaunchVM();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => vm.init(context));
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Center(
        child: SizedBox(height: 10.h), // pure gradient hold
      ),
    );
  }
}
