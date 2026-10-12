import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/features/authentication/screens/new_account.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/features/onboarding/screens/app_start_screen.dart';
import 'package:tasks/features/onboarding/screens/splash_screen.dart';
import 'package:tasks/features/onboarding/screens/onboardingScreen.dart';
import 'package:tasks/features/home/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar');

  await Supabase.initialize(
    url: 'https://cihhvxnwdfdjggtgdlhe.supabase.co',
    publishableKey: 'sb_publishable_3G396JlettKBrWTd4k8A8Q_RxENv2e-',
  );

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
      home: AppStartScreen(),
    );
  }
}
