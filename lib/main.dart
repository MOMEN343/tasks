import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks/features/onboarding/screens/app_start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar');

  await Supabase.initialize(
    url: 'https://cihhvxnwdfdjggtgdlhe.supabase.co',
    publishableKey: 'sb_publishable_3G396JlettKBrWTd4k8A8Q_RxENv2e-',
  );
  runApp(const ProviderScope(child: MyApp()));
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
