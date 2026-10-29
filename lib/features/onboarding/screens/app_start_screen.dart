import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks/features/onboarding/screens/splash_screen.dart';
import 'package:tasks/features/onboarding/screens/onboardingScreen.dart';
import 'package:tasks/features/authentication/screens/login_screen.dart';
import 'package:tasks/features/home/screens/home_screen.dart';
import 'package:tasks/features/onboarding/screens/splash_screen2.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({super.key});

  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  @override
  void initState() {
    super.initState();

    _determineFirstScreen();
  }

  Future<void> _determineFirstScreen() async {
    final preferences = await SharedPreferences.getInstance();

    final hasSeenOnboarding = preferences.getBool("hasSeenOnboarding") ?? false;

    Widget nextScreen;

    if ((Supabase.instance.client.auth.currentSession) != null &&
        (Supabase.instance.client.auth.currentUser?.phoneConfirmedAt) != null) {
      try {
        final profile = await Supabase.instance.client
            .from("profiles")
            .select("id")
            .eq("id", Supabase.instance.client.auth.currentUser!.id)
            .maybeSingle()
            .timeout(const Duration(seconds: 10));

        nextScreen = profile != null ? HomeScreen() : LoginScreen();
      } on TimeoutException {
        debugPrint("Profile request timed out");
        nextScreen = LoginScreen();
      } on PostgrestException catch (e) {
        debugPrint("Profile database error: ${e.code}");
        nextScreen = LoginScreen();
      } catch (e) {
        debugPrint("Profile request failed: $e");
        nextScreen = LoginScreen();
      }
    } else if (!hasSeenOnboarding) {
      nextScreen = Onboardingscreen();
    } else {
      nextScreen = LoginScreen();
    }

    if (!mounted) return;

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen2();
  }
}
