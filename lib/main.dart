import 'package:dokterian_test/app.dart';
import 'package:dokterian_test/app_injection.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjection.inject();

  runApp(const DokterianApp());
}
