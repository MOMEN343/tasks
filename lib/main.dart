import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/features/authentication/screens/login_screen.dart';
import 'package:tasks/features/home/screens/home_screen.dart';
import 'package:tasks/features/onboarding/screens/onboarding2.dart';
import 'package:tasks/features/onboarding/screens/onboarding3.dart';
import 'package:tasks/features/onboarding/screens/onboardingScreen.dart';
import 'package:tasks/features/wallet/screens/add_bank_account.dart';
import 'package:tasks/features/wallet/screens/wallet_screen.dart';
import 'features/onboarding/screens/onboarding1.dart';
import 'features/onboarding/screens/splash_screen.dart';
import 'features/onboarding/screens/splash_screen2.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: ManagerFontFamily.almarai,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
