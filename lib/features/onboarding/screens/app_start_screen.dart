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
  Widget _nextScreen = const SplashScreen2();

  @override
  void initState() {
    super.initState();

    _determineFirstScreen();
  }

  Future<void> _determineFirstScreen() async {
    await Future.delayed(Duration(seconds: 3));

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
            .maybeSingle();

        nextScreen = profile != null ? HomeScreen() : LoginScreen();
      } catch (e) {
        debugPrint("Error: $e");
        nextScreen = LoginScreen();
      }
    } else if (!hasSeenOnboarding) {
      nextScreen = Onboardingscreen();
    } else {
      nextScreen = LoginScreen();
    }

    if (!mounted) return;

    setState(() {
      _nextScreen = nextScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _nextScreen;
  }
}
