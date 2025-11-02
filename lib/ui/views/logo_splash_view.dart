import 'package:flutter/material.dart';
import '../components/gradient_background.dart';
import '../components/app_logo.dart';
import '../viewmodels/logo_vm.dart';

class LogoSplashView extends StatefulWidget {
  const LogoSplashView({super.key});

  @override
  State<LogoSplashView> createState() => _LogoSplashViewState();
}

class _LogoSplashViewState extends State<LogoSplashView> {
  final vm = LogoVM();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => vm.init(context));
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(child: Center(child: const AppLogo(widthW: 28)));
  }
}
