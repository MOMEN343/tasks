import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  Future<Map<String, dynamic>?> getCurrentProfile() async {
    if (Supabase.instance.client.auth.currentUser?.id == null) {
      return null;
    }

    final profile = await Supabase.instance.client
        .from('profiles')
        .select('name')
        .eq('id', Supabase.instance.client.auth.currentUser!.id)
        .maybeSingle();

    return profile;
  }
}
