import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'router.dart';

class TailorFitApp extends StatelessWidget {
  const TailorFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TailorFit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}