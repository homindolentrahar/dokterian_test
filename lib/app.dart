import 'package:dokterian_test/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DokterianApp extends StatelessWidget {
  const DokterianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dokterian",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text("Hello, Dokterian!"),
        ),
      ),
    );
  }
}
