import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks/features/home/models/event_model.dart';

class EventsService {
  Future<List<EventModel>> getEvents() async {
    if (Supabase.instance.client.auth.currentUser == null) {
      throw Exception('User is not logged in');
    }

    final response = await Supabase.instance.client
        .from("events")
        .select()
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id)
        .order('event_date');

    return response.map((event) => EventModel.fromJson(event)).toList();
  }
}
